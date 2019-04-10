/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserEntity;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author PushkarSharma
 */
@Entity
public class UserData {
    @Id
    private String userId;
    private String password;
    private String batch;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    @Override
    public String toString(){
        return this.userId+" "+this.password+" "+this.batch;
    }
}
