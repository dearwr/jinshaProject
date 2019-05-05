package jinsha.mapper;

import jinsha.pojo.User;

import java.util.List;

public interface UserMapper {

    User selectOneByUsername(String username);

    boolean insertOneUser(User user);

    User selectOneByUserId(int uid);

    List<User> selectUsersByPid(Integer pid);
}
