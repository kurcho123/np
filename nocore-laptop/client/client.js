RegisterNetEvent('nocore-laptop:callback');
RegisterNuiCallbackType('nocore-laptop:close');

// Remove NUI focus on start (incase of a resource restart)
setImmediate(() => {
    SetNuiFocus(false, false);
    emit('nocore-items:client:close:gaming-laptop');
});

// A command that opens the computer if the player is near a location, if enabled in the config
onNet('OpenLaptop:JS', () => {
    SetNuiFocus(true, true);
    SendNuiMessage(JSON.stringify({
        action: 'open',
        device: 'computer',
        location: 'nocore-laptop',
        loginLogo: 'assets/images/logo_buddy.png',
        loginBackground: 'assets/images/login_buddy.jpg',
        excludePrograms: [],
        desktopBackground: 'assets/images/windows.png',
        overrideBackground: true,
        job: 'all',
        login: false,
        run: false
    }));
});

// Remove NUI focus < called from NUI
on('__cfx_nui:nocore-laptop:close', (data, cb) => {
    SetNuiFocus(false, false);
    emit('nocore-items:client:close:gaming-laptop');
    cb(true);
});