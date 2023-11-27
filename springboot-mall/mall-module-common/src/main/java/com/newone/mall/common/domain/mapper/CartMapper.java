package com.newone.mall.common.domain.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.newone.mall.common.domain.dos.CartDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper extends BaseMapper<CartDO> {
    default List<CartDO> selectByUserId(Integer userId) {
        LambdaQueryWrapper<CartDO> wrapper = Wrappers.<CartDO>lambdaQuery()
                .eq(CartDO::getUserId,userId);
        return selectList(wrapper);
    }
}
