package jinsha.service;


import jinsha.pojo.CollectItem;

import java.util.List;


public interface CollectionService {

    Boolean addToCollection(CollectItem collectItem);

    List<CollectItem> queryAll(int uid);

    boolean deleteOneCollectItem(int id);
}
