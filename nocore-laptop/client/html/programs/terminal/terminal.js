let tHeight = 0;

$('#t-text').empty();

function terminalText( text ) {
    let texts = text.split(',');

    for (let i = 0; i < texts.length; i++) {
        $('#t-text').append( `<p>${ texts[i] }<br/></p>` );
        tHeight += 22;
    }

    $('.program-terminal .program-content').animate({ scrollTop: tHeight });
}

function wrongCommand() {
    terminalText('Wrong command.. Use help');
}

function terminalCmd( cmds ) {
    let cmd = cmds.split(' ');

    terminalText( `${ $('#t-input span').text() + cmd[0]}<br/>` );

    switch( cmd[0] ) {
        case 'inject':
            if ( cmd[1] && cmd[1] === '-fleecattrijan.exe' ) {
                $.post('http://nocore-laptop/CheckFleecaHack', JSON.stringify({}), function(canhack){
                    console.log(canhack);
                    if (canhack) {
                        terminalText(`struct group_info init_groups = { .usage = ATOMIC_INIT(2) };,`);
            
                        setTimeout(function () {
                            terminalText(`struct group_info *groups_alloc(int gidsetsize){,`);
                            setTimeout(function () {
                                terminalText(`struct group_info *group_info;,`);
                                setTimeout(function () {
                                    terminalText(`int nblocks;,`);
                                    setTimeout(function () {
                                        terminalText(`int i;,`);
                                        setTimeout(function () {
                                            terminalText(`nblocks = (gidsetsize + NGROUPS_PER_BLOCK - 1) / NGROUPS_PER_BLOCK;,`);
                                            setTimeout(function () {
                                                terminalText(`group_info = kmalloc(sizeof(*group_info) + nblocks*sizeof(gid_t *), GFP_USER);,`);
                                                terminalText(`if (!group_info),` +
                                                    `return NULL;,`);
                                                    terminalText('');
                                                    terminalText('BBV: Trojan Injected');
                                                    startfleecahack();
                                                    CloseLaptop();
                                            }, 700);
                                        }, 700);
                                    }, 700);
                                }, 700);
                            }, 700);
                        }, 700);
                    } else {
                        terminalText(`Trying to connect to 87.121.54.26:`);
            
                        setTimeout(function () {
                            terminalText(`Request timed out.`);
                            setTimeout(function () {
                                terminalText(`Request timed out.`);
                                setTimeout(function () {
                                    terminalText(`Request timed out.`);
                                    setTimeout(function () {
                                        terminalText(`Request timed out.`);
                                        terminalText(``);
                                        terminalText('Connection failed.');
                                    }, 700);
                                }, 700);
                            }, 700);
                        }, 700);
                    }
                });
            } else if (cmd[1] && cmd[1] === '-bbcattrijan.exe') {
                $.post('http://nocore-laptop/CheckBobcatHack', JSON.stringify({}), function(canhack){
                    console.log(canhack)
                    if (canhack) {
                        let time = getRandomInt(60, 120);
                        terminalText(`Pinging 87.121.54.26 with 32 bytes of data:`);
            
                        setTimeout(function () {
                            terminalText(`Reply from 87.121.54.26: bytes=32 time=${time}ms TTL=57`);
                            setTimeout(function () {
                                terminalText(`Request timed out.`);
                                setTimeout(function () {
                                    terminalText(`Request timed out.`);
                                    setTimeout(function () {
                                        terminalText(`Request timed out.`);
                                        terminalText(`Ping statistics for 87.121.54.26:, ` +
                                            `<span>Packets: Sent = 4. Received = 1. Lost = 3 (75% loss)</span>, `);
                                            terminalText('');
                                            terminalText('Executed: Trojan Hack');
                                            startBobcat();
                                    }, 700);
                                }, 700);
                            }, 700);
                        }, 700);
                    } else {
                        terminalText(`Trying to connect to 87.121.54.26:`);
            
                        setTimeout(function () {
                            terminalText(`Request timed out.`);
                            setTimeout(function () {
                                terminalText(`Request timed out.`);
                                setTimeout(function () {
                                    terminalText(`Request timed out.`);
                                    setTimeout(function () {
                                        terminalText(`Request timed out.`);
                                        terminalText(``);
                                        terminalText('Connection failed.');
                                    }, 700);
                                }, 700);
                            }, 700);
                        }, 700);
                    }
                });
            }
            break;
        case 'ping':
            let ip = cmd[1];
            if ( ip ) {
                let time = [getRandomInt(60, 14), getRandomInt(60, 14), getRandomInt(60, 14), getRandomInt(60, 14)];
                terminalText(`Pinging ${ip} with 32 bytes of data:`);
    
                setTimeout(function () {
                    terminalText(`Reply from ${ip}: bytes=32 time=${time[0]}ms TTL=57`);
                    setTimeout(function () {
                        terminalText(`Reply from ${ip}: bytes=32 time=${time[1]}ms TTL=57`);
                        setTimeout(function () {
                            terminalText(`Reply from ${ip}: bytes=32 time=${time[2]}ms TTL=57`);
                            setTimeout(function () {
                                terminalText(`Reply from ${ip}: bytes=32 time=${time[3]}ms TTL=57<br/>`);
                                terminalText(`Ping statistics for ${ip}:, ` +
                                    `<span>Packets: Sent = 4. Received = 4. Lost = 0 (0% loss)</span>, ` +
                                    `Approximate round trip times in milli-seconds:, ` +
                                    `<span>Minimum = ${Math.min(...time)}ms. Maximum = ${Math.max(...time)}ms. Average = ${Math.round(time.reduce((a, b) => a + b, 0) / time.length)}ms</span>`);
                                    terminalText('');
                            }, 700);
                        }, 700);
                    }, 700);
                }, 700);
            } else {
                wrongCommand();
            }
            break;
        case 'clear':
            $('#t-text').empty();
            break;
        case 'help':
            terminalText(`Command list:, 
                <span>clear</span>,
                <span>ipconfig</span>,
                <span>inject</span>,
                <span>ping [ip]</span>`);
                terminalText('');
            break;
        case 'cmdlist':
            terminalText(`Command list:, 
                <span>clear</span>,
                <span>ipconfig</span>,
                <span>inject</span>,
                <span>ping [ip]</span>`);
                terminalText('');
            break;
        case 'commands':
            terminalText(`Command list:, 
                <span>clear</span>,
                <span>ipconfig</span>,
                <span>inject</span>,
                <span>ping [ip]</span>`);
                terminalText('');
            break;
        default:
            terminalText('Command not found.. Use /help');
    }
}

$('#t-input span').text(`C:\\Users\\${ loggedInUser.username }>`);

$('.program-terminal').click(() => {
    $('#t-input input').focus();
});

$('#t-input').submit(() => {
    if ( $('#t-input input').val().length > 0 ) {
        terminalCmd( $('#t-input input').val().toLowerCase() );
        $('#t-input input').val('');
    }
  
    return false;
});


function startfleecahack() {
    $.post('http://nocore-laptop/StartFleeca');
}

function startBobcat() { 
    $.post('http://nocore-laptop/StartBobcatHack', JSON.stringify({}));
}

function CloseLaptop() {
    $('#computer-frame').animate({
        marginTop: '100vh',
    }, 500, () => {
        $('#nocore-laptop').hide();
        $('#computer-loading .preloader-wrapper').hide();
    });

    let iconSlots = {};

    $('.icon-container').each(function() {
        let icon = $(this).find('.icon');

        if ( icon.length === 1 ) {
            iconSlots[icon.attr('program')] = $(this).attr('class').split(' ')[1];
        }
    });

    iconSlots = JSON.stringify(iconSlots);

    if ( loggedInUser && ( JSON.stringify(loggedInUser.iconslots) != iconSlots ) ) {
        fetch('http://nocore-laptop/nocore-laptop:close', {
            method: 'POST',
            body: JSON.stringify({
                type: 'updateUserIconSlots',
                data: {
                    '@iconslots': iconSlots,
                    '@username': loggedInUser.username,
                    '@password': loggedInUser.password
                }
            })
        });
    } else {
        fetch('http://nocore-laptop/nocore-laptop:close');
    } 
}