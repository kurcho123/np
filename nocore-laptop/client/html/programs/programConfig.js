const programs = {
    'account': {
        'title': 'Профил', // Title in the left corner of the program 
        'icons': { // Icon options
            start: true, // Start menu icon
            desktop: false, // Desktop icon
            taskbar: true // Taskbar icon
        },
        'options': { // Program window options
            allowMinimize: true, // Minimze window
            allowResize: true, // Toggle fullscreen
            allowRefresh: false // Enables the refresh function, calls the programs refresh function: refreshprogram() where the program is the name, in this case refreshaccount()
        },
        'access': { // Allowed jobs and group.
            group: 'all', // Allowed group. admin, user, all, null
            job: ['all'] // Allowed job, if set to 'all' every job will see it
        },
        'onStart': { // When the program loads in this will run..
            fullscreen: true // Only currently used to start the program in fullscreen or not
        },
        'tablet': false // Allows the program to be accessed through the tablet if set to true
    },

    'tor': {
        'title': 'Tor',
        'icons': {
            desktop: true
        },
        'options': {
            allowMinimize: true, // Minimze window
            allowResize: true, // Toggle fullscreen
        },
        'access': {
            group: 'null',
            job: ['all']
        },
        'onStart': {
            fullscreen: false
        },
        'tablet': false // Allows the program to be accessed through the tablet if set to true
    },

    'buypage': {
        'title': 'Buy page',
        'icons': {
            desktop: false
        },
        'options': {
            allowMinimize: true, // Minimze window
            allowResize: true, // Toggle fullscreen
        },
        'access': {
            group: 'null',
            job: ['all']
        },
        'onStart': {
            fullscreen: true
        },
        'tablet': true // Allows the program to be accessed through the tablet if set to true
    },

    'cardel': {
        'title': 'Chat',
        'icons': {
            desktop: true
        },
        'options': {
            allowMinimize: true, // Minimze window
            allowResize: false, // Toggle fullscreen
        },
        'access': {
            group: 'null',
            job: ['all']
        },
        'onStart': {
            fullscreen: true
        },
        'tablet': true // Allows the program to be accessed through the tablet if set to true
    },

    'incaso': {
        'title': 'AnonyChatty',
        'icons': {
            desktop: false
        },
        'options': {
            allowMinimize: true, // Minimze window
            allowResize: false, // Toggle fullscreen
        },
        'access': {
            group: 'null',
            job: ['all']
        },
        'onStart': {
            fullscreen: true
        },
        'tablet': true // Allows the program to be accessed through the tablet if set to true
    },

    'sellpage': {
        'title': 'Sell Page',
        'icons': {
            desktop: false
        },
        'options': {
            allowMinimize: true, // Minimze window
            allowResize: true, // Toggle fullscreen
        },
        'access': {
            group: 'null',
            job: ['all']
        },
        'onStart': {
            fullscreen: true
        },
        'tablet': true // Allows the program to be accessed through the tablet if set to true
    },
    
    'calcylator': {
        'title': 'Калколатор',
        'options': {
            allowMinimize: true
        },
        'icons': {
            start: true
        },
        'access': {
            group: 'all',
            job: ['all']
        },
        'onStart': {
            width: '180px',
            height: '295px'
        }
    },

    'terminal': {
        'title': 'Терминал',
        'options': {
            allowMinimize: true
        },
        'icons': {
            start: true
        },
        'access': {
            group: 'all',
            job: ['all']
        },
        'onStart': {
            width: '500px',
            height: '300px'
        }
    },

    'controlpanel': {
        'title': 'Контролен Панел',
        'icons': {
            start: true
        },
        'options': {
            allowMinimize: true,
            allowResize: true
        },
        'access': {
            group: 'all',
            job: ['all']
        },
        'onStart': {
            fullscreen: false
        },
        'tablet': false // Allows the program to be accessed through the tablet if set to true
    },

}