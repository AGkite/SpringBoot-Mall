package com.newone.mall.common.domain.dos;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("shopping_cart")
public class CartDO {
    @TableId(type = IdType.AUTO)
    private Integer cartId;
    private Integer userId;
    private Integer productId;
    private String productName;
    private String image;
    private int quantity;
    private BigDecimal price;
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createDate;
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime modifyDate;
}
