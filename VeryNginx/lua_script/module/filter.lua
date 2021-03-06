-- -*- coding: utf-8 -*-
-- @Date    : 2016-01-02 00:46
-- @Author  : Alexa (AlexaZhou@163.com)
-- @Link    :
-- @Disc    : filter request'uri maybe attack

local _M = {}

local VeryNginxConfig = require "VeryNginxConfig"
local request_tester = require "request_tester"


function _M.filter()

    if VeryNginxConfig.configs["filter_enable"] ~= true then
        return
    end

    local matcher_list = VeryNginxConfig.configs['matcher']

    for i,rule in ipairs( VeryNginxConfig.configs["filter_rule"] ) do
        local enable = rule['enable']
        local matcher = matcher_list[rule['matcher']]
        if enable == true and request_tester.test( matcher ) == true then
            local action = rule['action']
            if action == 'accept' then
                return
            else
                ngx.exit(tonumber(rule['code']))
            end
        end
    end
end

return _M
