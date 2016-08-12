package fgik.fadlarec.vo;

import java.util.List;

import fgik.fadlarec.model.User;

public class UserListVO {
    private int pagesCount;
    private long totalUsers;

    private String actionMessage;
    private String searchMessage;

    private List<User> users;

    public UserListVO() {
    }

    public UserListVO(int pages, long totalUsers, List<User> users) {
        this.pagesCount = pages;
        this.users = users;
        this.totalUsers = totalUsers;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public long getTotalUsers() {
        return totalUsers;
    }

    public void setTotalUsers(long totalUsers) {
        this.totalUsers = totalUsers;
    }

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage;
    }

    public String getSearchMessage() {
        return searchMessage;
    }

    public void setSearchMessage(String searchMessage) {
        this.searchMessage = searchMessage;
    }
}
