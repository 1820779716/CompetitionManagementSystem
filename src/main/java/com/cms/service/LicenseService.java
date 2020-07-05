package com.cms.service;

import com.cms.entity.License;

public interface LicenseService {
    /**
     * 添加参赛证
     * @param license
     * @return
     */
    public boolean insertLicense(License license);
    /**
     * 获取参赛证
     * @return License对象
     */
    public License getLicenseById(int competitorId);
}