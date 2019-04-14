/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LibFacultyEntity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author PushkarSharma
 */
@Entity
@Table(name="finedata")
public class AddFineEnt implements Serializable {
    @Id
    private String userId;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date returnDate;
    private int fine;
    @Id
    private String fineForBook;
    private int Nooffinedays;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public int getFine() {
        return fine;
    }

    public void setFine(int fine) {
        this.fine = fine;
    }

    public String getFineForBook() {
        return fineForBook;
    }

    public void setFineForBook(String fineForBook) {
        this.fineForBook = fineForBook;
    }

    public int getNooffinedays() {
        return Nooffinedays;
    }

    public void setNooffinedays(int Nooffinedays) {
        this.Nooffinedays = Nooffinedays;
    }
    
}
