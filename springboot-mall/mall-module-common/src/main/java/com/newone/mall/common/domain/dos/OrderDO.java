package com.newone.mall.common.domain.dos;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("orders")
public class OrderDO {
    @TableId(type = IdType.AUTO)
    private Integer orderId;
    private Integer userId;
    private Integer productId;
    private int quantity;
    private int payType;
    private BigDecimal totalAmount;
    private LocalDateTime createDate;
}
