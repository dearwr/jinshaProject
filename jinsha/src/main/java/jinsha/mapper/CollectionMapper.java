package jinsha.mapper;

import jinsha.pojo.CollectItem;

import java.util.List;

public interface CollectionMapper {

    boolean insertOne(CollectItem collectItem);

    CollectItem selectByUidItemId(int uid, int itemId);

    List<CollectItem> selectByUid(int uid);

    boolean deleteOneCollectItem(int id);
}
