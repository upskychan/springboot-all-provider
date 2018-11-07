package com.upsky.springboot.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.upsky.springboot.mapper.UserMapper;
import com.upsky.springboot.model.User;
import com.upsky.springboot.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component  //spring的注解
@Service  //dubbo的注解
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 注入spring boot自动配置好的RedisTemplate.
     */
    @Autowired
    private RedisTemplate<Object,Object> redisTemplate;

    /**
     * 分页查询用户。
     * @param paramMap 参数
     * @return 用户列表
     */
    @Override
    public List<User> listUsersByPage(Map<String, Object> paramMap) {
        return userMapper.selectUsersByPage(paramMap);
    }

    /**
     * 查询用户总数。
     * @return 用户总数
     */
    @Override
    public int getTotalUser() {
        // 设置RedisTemplate的key的序列化器
        RedisSerializer redisSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(redisSerializer);

        Integer totalUsers = (Integer) redisTemplate.opsForValue().get("SBA_totalUsers");
        // 使用双重检测锁解决高并发下缓存穿透的问题
        if(null == totalUsers) {
            synchronized (this) {
                totalUsers = (Integer) redisTemplate.opsForValue().get("SBA_totalUsers");
                // 若缓存中没有，则从数据库中查询
                if(null == totalUsers) {
                    totalUsers = userMapper.selectTotalUser();
                    // 同时将数据放入缓存
                    redisTemplate.opsForValue().set("SBA_totalUsers",totalUsers);
                }
            }
        }

        return totalUsers;
    }

    /**
     * 通过ID查询用户。
     * @param userId
     * @return
     */
    @Override
    public User getUserById(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    /**
     * 新增用户。
     * @param user
     * @return
     */
    @Override
    public int addUser(User user) {
        int result = userMapper.insertSelective(user);
        if(result > 0){//如果添加用户成功，则更新缓存
            redisTemplate.setKeySerializer(new StringRedisSerializer());
            int totalUsers = userMapper.selectTotalUser();
            redisTemplate.opsForValue().set("SBA_totalUsers",totalUsers);
        }
        return result;
    }

    /**
     * 修改用户。
     * @param user
     * @return
     */
    @Override
    public int updateUser(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    /**
     * 删除用户。
     * @param id
     * @return
     */
    @Override
    public int deleteUser(Integer id) {
        int result = userMapper.deleteByPrimaryKey(id);
        if(result > 0){//如果删除用户成功，则更新缓存
            redisTemplate.setKeySerializer(new StringRedisSerializer());
            int totalUsers = userMapper.selectTotalUser();
            redisTemplate.opsForValue().set("SBA_totalUsers",totalUsers);
        }
        return result;
    }
}
