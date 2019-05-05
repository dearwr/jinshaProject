package jinsha.service;

import jinsha.pojo.User;

import java.util.List;

public interface UserService {

    User doLogin(String username, String password);

    boolean doRegister(User user);

    User queryOneUser(int uid);

    List<User> queryUsersByPid(Integer id);
}
