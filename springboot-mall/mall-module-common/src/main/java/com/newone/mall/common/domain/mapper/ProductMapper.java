package com.newone.mall.common.domain.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.newone.mall.common.domain.dos.ProductDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper extends BaseMapper<ProductDO> {

}
