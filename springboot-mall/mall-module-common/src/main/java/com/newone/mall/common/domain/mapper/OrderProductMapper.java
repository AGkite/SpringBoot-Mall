package com.newone.mall.common.domain.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.newone.mall.common.domain.vo.OrderProductVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrderProductMapper extends BaseMapper<OrderProductVO> {
    @Select("SELECT p.product_name, p.image, o.quantity, o.pay_type, o.total_amount, o.create_date " +
            "FROM orders o INNER JOIN products p ON o.product_id = p.product_id "+
            "where o.user_id = #{userId}")
    List<OrderProductVO> getOrderProductList(@Param("userId") Integer userId);
}
