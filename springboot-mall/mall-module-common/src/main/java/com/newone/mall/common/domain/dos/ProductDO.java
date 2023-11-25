package com.newone.mall.common.domain.dos;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("products")
public class ProductDO {
    @TableId(type = IdType.AUTO)
    private Integer productId;
    private String productName;
    private String description;
    private String category;
    private BigDecimal price;
    private Integer stock;
    private String image;
}
