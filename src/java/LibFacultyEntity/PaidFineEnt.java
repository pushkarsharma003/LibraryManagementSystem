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
@Table(name="paidfinedata")
public class PaidFineEnt implements Serializable {
    @Id
    private String userId;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date returnDate;
    private int paidfine;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date paidfinedate;
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

    public int getPaidfine() {
        return paidfine;
    }

    public void setPaidfine(int paidfine) {
        this.paidfine = paidfine;
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

    public Date getPaidfinedate() {
        return paidfinedate;
    }

    public void setPaidfinedate(Date paidfinedate) {
        this.paidfinedate = paidfinedate;
    }
    
}
