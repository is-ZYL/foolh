package com.fh.lw.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * created with Intellij IDEA
 *
 * @author : yuanyuana
 * Date : 2018-08-27
 * Time : 17:58
 */
@Table(name ="tb_fool_type")
public class FoolMenuType extends BasePojo {
    @Id
    private Integer id;
    private String type;//菜品类型
    private Integer status;//类型状态

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
