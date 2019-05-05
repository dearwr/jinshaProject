package jinsha.service.impl;

import jinsha.mapper.CollectionMapper;
import jinsha.pojo.CollectItem;
import jinsha.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectionServiceImpl implements CollectionService {


    @Autowired
    private CollectionMapper collectionMapper;

    @Override
    public Boolean addToCollection(CollectItem collectItem) {
        CollectItem tmpItem = collectionMapper.selectByUidItemId(collectItem.getUid(), collectItem.getItemId());
        if (tmpItem == null) {
            return collectionMapper.insertOne(collectItem);
        }
        return false;
    }

    @Override
    public List<CollectItem> queryAll(int uid) {
        return collectionMapper.selectByUid(uid);
    }


    @Override
    public boolean deleteOneCollectItem(int id) {
        return collectionMapper.deleteOneCollectItem(id);
    }

}
