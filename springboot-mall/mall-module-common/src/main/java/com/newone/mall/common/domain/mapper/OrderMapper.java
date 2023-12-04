package com.newone.mall.common.domain.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.newone.mall.common.domain.dos.OrderDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper extends BaseMapper<OrderDO> {

}
