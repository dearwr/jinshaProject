package jinsha.mapper;

import jinsha.pojo.ItemComment;

import java.util.List;

public interface CommentMapper {

    List<ItemComment> selectAllByItemId(int ItemId);
}
