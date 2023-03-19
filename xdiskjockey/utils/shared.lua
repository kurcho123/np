function _T(str, ...)
    local text = Locales[str]
    return string.format(text, ...)
end

function Debug(...)
    if Config.Debug then
        print(...)
    end
end