package jinsha.service.impl;

import jinsha.mapper.UserMapper;
import jinsha.pojo.User;
import jinsha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;

    /**
     * 登陆
     * @param username
     * @param password
     * @return
     */
    public User doLogin(String username, String password) {
        User user = userMapper.selectOneByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    /**
     * 查询
     * @param user
     * @return
     */
    @Override
    public boolean doRegister(User user) {
        User hasUser = userMapper.selectOneByUsername(user.getUsername());
        if (hasUser == null) {
            user.setCreated(new Date());
            user.setPicture("../assets/img/universal.PNG");
            userMapper.insertOneUser(user);
            return true;
        }
        return false;
    }

    @Override
    public User queryOneUser(int uid) {
        return userMapper.selectOneByUserId(uid);
    }


    @Override
    public List<User> queryUsersByPid(Integer pid) {
        return userMapper.selectUsersByPid(pid);
    }


}
