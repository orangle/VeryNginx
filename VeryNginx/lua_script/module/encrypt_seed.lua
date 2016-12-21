-- -*- coding: utf-8 -*-
-- -- @Date    : 2016-02-02 13:37
-- -- @Author  : Alexa (AlexaZhou@163.com)
-- -- @Link    :
-- -- @Disc    : auto generate encrypt_seed

local VeryNginxConfig = require "VeryNginxConfig"
local dkjson = require "dkjson"


local _M = {}
_M.seed = nil

function _M.get_seed()

    -- shm store seed
    if _M.seed ~= nil then
        return _M.seed
    end

    _M.seed = "verynginx_lzz_fork"
    return _M.seed
end

return _M
