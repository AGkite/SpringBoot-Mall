package com.newone.mall.common.domain.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class OrderProductVO {

    @TableField("product_name")
    private String productName;

    @TableField("image")
    private String image;

    @TableField("quantity")
    private Integer quantity;

    @TableField("pay_type")
    private String payType;

    @TableField("total_amount")
    private Double totalAmount;

    @TableField("create_date")
    private LocalDateTime createDate;

}

