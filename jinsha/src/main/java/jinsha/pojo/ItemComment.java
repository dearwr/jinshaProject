package jinsha.pojo;

import java.util.Date;

public class ItemComment {
    private Integer id;

    private int itemId;

    private int userId;

    private Date time;

    private String content;

    private int record;

    private User user;

    private double avgRecord;

    public double getAvgRecord() {
        return avgRecord;
    }

    public void setAvgRecord(double avgRecord) {
        this.avgRecord = avgRecord;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getRecord() {
        return record;
    }

    public void setRecord(int record) {
        this.record = record;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}