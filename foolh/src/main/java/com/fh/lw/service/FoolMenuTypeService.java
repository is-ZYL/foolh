package com.fh.lw.service;

import com.fh.lw.mapper.FoolLibraryMenuMapper;
import com.fh.lw.pojo.FoolMenuType;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * created with Intellij IDEA
 *
 * @author : yuanyuana
 * Date : 2018-08-27
 * Time : 17:58
 */
@Service
public class FoolMenuTypeService extends BaseService<FoolMenuType> {
    @Autowired
    private FoolShopService fShops;
    @Autowired
    private FoolSeasService fss;
    @Autowired
    private FoolMenuService fms;
    @Autowired
    private FoolLibraryMenuService flms;

    @Autowired
    private FoolLibrarySeasService fles;
    @Autowired
    private UserWxService us;
    @Autowired
    private FoolSeasService fle;
    @Autowired
    private FoolLibraryPrepareService flps;
    @Autowired
    private FoolMenuTypeService fts;

    public List<FoolMenuType> getFoolTypeList() {
        List<FoolMenuType> f = super.queryAll();
        return f;
    }
}
