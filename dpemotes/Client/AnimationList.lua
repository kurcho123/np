DP = {}

DP.Expressions = {
    ["Angry"] = {"Expression", "mood_angry_1"},
    ["Drunk"] = {"Expression", "mood_drunk_1"},
    ["Dumb"] = {"Expression", "pose_injured_1"},
    ["Electrocuted"] = {"Expression", "electrocuted_1"},
    ["Grumpy"] = {"Expression", "effort_1"},
    ["Grumpy2"] = {"Expression", "mood_drivefast_1"},
    ["Grumpy3"] = {"Expression", "pose_angry_1"},
    ["Happy"] = {"Expression", "mood_happy_1"},
    ["Injured"] = {"Expression", "mood_injured_1"},
    ["Joyful"] = {"Expression", "mood_dancing_low_1"},
    ["Mouthbreather"] = {"Expression", "smoking_hold_1"},
    ["Never Blink"] = {"Expression", "pose_normal_1"},
    ["One Eye"] = {"Expression", "pose_aiming_1"},
    ["Shocked"] = {"Expression", "shocked_1"},
    ["Shocked2"] = {"Expression", "shocked_2"},
    ["Sleeping"] = {"Expression", "mood_sleeping_1"},
    ["Sleeping2"] = {"Expression", "dead_1"},
    ["Sleeping3"] = {"Expression", "dead_2"},
    ["Smug"] = {"Expression", "mood_smug_1"},
    ["Speculative"] = {"Expression", "mood_aiming_1"},
    ["Stressed"] = {"Expression", "mood_stressed_1"},
    ["Sulking"] = {"Expression", "mood_sulk_1"},
    ["Weird"] = {"Expression", "effort_2"},
    ["Weird2"] = {"Expression", "effort_3"},
}

DP.Walks = {
    ["Alien"] = {"move_m@alien"},
    ["Armored"] = {"anim_group_move_ballistic"},
    ["Arrogant"] = {"move_f@arrogant@a"},
    ["Brave"] = {"move_m@brave"},
    ["Casual"] = {"move_m@casual@a"},
    ["Casual2"] = {"move_m@casual@b"},
    ["Casual3"] = {"move_m@casual@c"},
    ["Casual4"] = {"move_m@casual@d"},
    ["Casual5"] = {"move_m@casual@e"},
    ["Casual6"] = {"move_m@casual@f"},
    ["Chichi"] = {"move_f@chichi"},
    ["Confident"] = {"move_m@confident"},
    ["Cop"] = {"move_m@business@a"},
    ["Cop2"] = {"move_m@business@b"},
    ["Cop3"] = {"move_m@business@c"},
    ["Default Female"] = {"move_f@multiplayer"},
    ["Default Male"] = {"move_m@multiplayer"},
    ["Drunk"] = {"move_m@drunk@a"},
    ["Drunk"] = {"move_m@drunk@slightlydrunk"},
    ["Drunk2"] = {"move_m@buzzed"},
    ["Drunk3"] = {"move_m@drunk@verydrunk"},
    ["Femme"] = {"move_f@femme@"},
    ["Fire"] = {"move_characters@franklin@fire"},
    ["Fire2"] = {"move_characters@michael@fire"},
    ["Fire3"] = {"move_m@fire"},
    ["Flee"] = {"move_f@flee@a"},
    ["Franklin"] = {"move_p_m_one"},
    ["Gangster"] = {"move_m@gangster@generic"},
    ["Gangster2"] = {"move_m@gangster@ng"},
    ["Gangster3"] = {"move_m@gangster@var_e"},
    ["Gangster4"] = {"move_m@gangster@var_f"},
    ["Gangster5"] = {"move_m@gangster@var_i"},
    ["Grooving"] = {"anim@move_m@grooving@"},
    ["Guard"] = {"move_m@prison_gaurd"},
    ["Handcuffs"] = {"move_m@prisoner_cuffed"},
    ["Heels"] = {"move_f@heels@c"},
    ["Heels2"] = {"move_f@heels@d"},
    ["Hiking"] = {"move_m@hiking"},
    ["Hipster"] = {"move_m@hipster@a"},
    ["Hobo"] = {"move_m@hobo@a"},
    ["Hurry"] = {"move_f@hurry@a"},
    ["Janitor"] = {"move_p_m_zero_janitor"},
    ["Janitor2"] = {"move_p_m_zero_slow"},
    ["Jog"] = {"move_m@jog@"},
    ["Lemar"] = {"anim_group_move_lemar_alley"},
    ["Lester"] = {"move_heist_lester"},
    ["Lester2"] = {"move_lester_caneup"},
    ["Maneater"] = {"move_f@maneater"},
    ["Michael"] = {"move_ped_bucket"},
    ["Money"] = {"move_m@money"},
    ["Muscle"] = {"move_m@muscle@a"},
    ["Posh"] = {"move_m@posh@"},
    ["Posh2"] = {"move_f@posh@"},
    ["Quick"] = {"move_m@quick"},
    ["Runner"] = {"female_fast_runner"},
    ["Sad"] = {"move_m@sad@a"},
    ["Sassy"] = {"move_m@sassy"},
    ["Sassy2"] = {"move_f@sassy"},
    ["Scared"] = {"move_f@scared"},
    ["Sexy"] = {"move_f@sexy@a"},
    ["Shady"] = {"move_m@shadyped@a"},
    ["Slow"] = {"move_characters@jimmy@slow@"},
    ["Swagger"] = {"move_m@swagger"},
    ["Tough"] = {"move_m@tough_guy@"},
    ["Tough2"] = {"move_f@tough_guy@"},
    ["Trash"] = {"clipset@move@trash_fast_turn"},
    ["Trash2"] = {"missfbi4prepp1_garbageman"},
    ["Trevor"] = {"move_p_m_two"},
    ["Wide"] = {"move_m@bag"},
-- I cant get these to work for some reason, if anyone knows a fix lmk
--["Caution"] = {"move_m@caution"},
--["Chubby"] = {"anim@move_m@chubby@a"},
--["Crazy"] = {"move_m@crazy"},
--["Joy"] = {"move_m@joy@a"},
--["Power"] = {"move_m@power"},
--["Sad2"] = {"anim@move_m@depression@a"},
--["Sad3"] = {"move_m@depression@b"},
--["Sad4"] = {"move_m@depression@d"},
--["Wading"] = {"move_m@wading"},
}

DP.Shared = {
        --[emotename] = {dictionary, animation, displayname, targetemotename, additionalanimationoptions}
        -- you dont have to specify targetemoteanem, if you do dont it will just play the same animation on both.
        -- targetemote is used for animations that have a corresponding animation to the other player.
        ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake", "handshake2", AnimationOptions =
            {
                EmoteMoving = true,
                EmoteDuration = 3000,
                SyncOffsetFront = 0.9
            }},
        ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 2", "handshake", AnimationOptions =
            {
                EmoteMoving = true,
                EmoteDuration = 3000
            }},
        ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug", "hug2", AnimationOptions =
            {
                EmoteMoving = false,
                EmoteDuration = 5000,
                SyncOffsetFront = 1.05,
            }},
        ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2", "hug", AnimationOptions =
            {
                EmoteMoving = false,
                EmoteDuration = 5000,
                SyncOffsetFront = 1.13
            }},
        ["bro"] = {"mp_ped_interaction", "hugs_guy_a", "Bro", "bro2", AnimationOptions =
            {
                SyncOffsetFront = 1.14
            }},
        ["bro2"] = {"mp_ped_interaction", "hugs_guy_b", "Bro 2", "bro", AnimationOptions =
            {
                SyncOffsetFront = 1.14
            }},
        ["give"] = {"mp_common", "givetake1_a", "Give", "give2", AnimationOptions =
            {
                EmoteMoving = true,
                EmoteDuration = 2000
            }},
        ["give2"] = {"mp_common", "givetake1_b", "Give 2", "give", AnimationOptions =
            {
                EmoteMoving = true,
                EmoteDuration = 2000
            }},
        ["baseball"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a", "Baseball", "baseballthrow"},
        ["baseballthrow"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b", "Baseball Throw", "baseball"},
        ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up", "stickupscared", AnimationOptions =
            {
                EmoteLoop = true,
                EmoteMoving = true,
            }},
        ["stickupscared"] = {"missminuteman_1ig_2", "handsup_base", "Stickup Scared", "stickup", AnimationOptions =
            {
                EmoteMoving = true,
                EmoteLoop = true,
            }},
        ["punch"] = {"melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook", "Punch", "punched"},
        ["punched"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_cross_r", "Punched", "punch"},
        ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt", "headbutted"},
        ["headbutted"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_headbutt", "Headbutted", "headbutt"},
        ["slap2"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_backslap", "Slap 2", "slapped2", AnimationOptions =
            {
                EmoteLoop = true,
                EmoteMoving = true,
                EmoteDuration = 2000,
            }},
        ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap", "slapped", AnimationOptions =
            {
                EmoteLoop = true,
                EmoteMoving = true,
                EmoteDuration = 2000,
            }},
        ["slapped"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_slap", "Slapped", "slap"},
        ["slapped2"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_backslap", "Slapped 2", "slap2"},
}

DP.Dances = {
    }

DP.PropDan = {
    ["dwhisky01"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_a_f1", "Dance whisky 01", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint01"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_a_f02", "Dance joint 01", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer01"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_a_m01", "Dance beer 01", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer02"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_a_m02", "Dance beer 02", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint02"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_a_m03", "Dance joint 02", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig01"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_a_m03", "Dance cig 01", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky02"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_a_m04", "Dance whisky 02", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine01"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_b_f1", "Dance wine 01", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig02"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_b_f02", "Dance cig 02", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer03"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_b_m01", "Dance beer 03", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer04"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_b_m02", "Dance beer 04", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig03"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_b_m03", "Dance cig 03", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky03"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_b_m04", "Dance whisky 03", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine02"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_c_f1", "Dance wine 02", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint03"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_c_f02", "Dance joint 03", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer05"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_c_m01", "Dance beer 05", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer06"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_c_m02", "Dance beer 06", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig04"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_c_m03", "Dance cig 04", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky04"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_c_m04", "Dance whisky 04", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig05"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_d_m03", "Dance cig 05", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig06"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_idle_e_m03", "Dance cig 06", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine03"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_loop_f1", "Dance wine 03", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint04"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_loop_f02", "Dance joint 04", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer07"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_loop_m01", "Dance beer 07", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer08"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_loop_m02", "Dance beer 08", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig07"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_loop_m03", "Dance cig 07", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky05"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_loop_m04", "Dance whisky 05", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine04"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_mi_f1", "Dance wine 04", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint05"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_mi_f02", "Dance joint 05", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer09"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_mi_m01", "Dance beer 09", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer10"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_mi_m02", "Dance beer 10", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig08"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_mi_m03", "Dance cig 08", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky06"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_mi_m04", "Dance whisky 06", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine05"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_ti_f1", "Dance wine 05", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint06"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_ti_f02", "Dance joint 06", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer11"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_ti_m01", "Dance beer 11", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer12"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_ti_m02", "Dance beer 12", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig09"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_ti_m03", "Dance cig 09", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky07"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "li_to_ti_m04", "Dance whisky 07", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine06"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_a_f1", "Dance wine 06", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint07"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_a_f02", "Dance joint 07", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer13"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_a_m01", "Dance beer 13", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer14"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_a_m02", "Dance beer 14", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig10"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_a_m03", "Dance cig 10", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky08"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_a_m04", "Dance whisky 08", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine07"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_b_f1", "Dance wine 07", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint08"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_b_f02", "Dance joint 07", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer15"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_b_m01", "Dance beer 15", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer16"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_b_m02", "Dance beer 16", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig11"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_b_m03", "Dance cig 11", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky09"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_b_m04", "Dance whisky 09", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine08"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_c_f1", "Dance wine 08", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint09"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_c_f02", "Dance joint 09", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer17"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_c_m01", "Dance beer 17", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer18"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_c_m02", "Dance beer 18", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig12"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_c_m03", "Dance cig 12", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky10"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_c_m04", "Dance whisky 10", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig13"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_d_m03", "Dance cig 13", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig14"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_e_m03", "Dance cig 14", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig15"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_idle_f_m03", "Dance cig 15", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine09"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_f1", "Dance wine 09", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint10"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_f02", "Dance joint 10", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer19"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_m01", "Dance beer 19", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer20"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_m02", "Dance beer 20", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig16"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_m03", "Dance cig 16", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky11"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_m04", "Dance whisky 11", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine10"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_li_f1", "Dance wine 10", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint11"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_li_f02", "Dance joint 11", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer21"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_li_m01", "Dance beer 21", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer22"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_li_m02", "Dance beer 22", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig17"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_li_m03", "Dance cig 17", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky12"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_li_m04", "Dance whisky 12", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine11"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_ti_f1", "Dance wine 11", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint12"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_ti_f02", "Dance joint 12", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer23"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_ti_m01", "Dance beer 23", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer24"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_ti_m02", "Dance beer 24", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig18"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_ti_m03", "Dance cig 18", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky13"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_to_ti_m04", "Dance whisky 13", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine12"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_a_f1", "Dance wine 12", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint13"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_a_f02", "Dance joint 13", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer25"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_a_m01", "Dance beer 25", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer26"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_a_m02", "Dance beer 26", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig19"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_a_m03", "Dance cig 19", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky14"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_a_m04", "Dance whisky 14", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine13"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_b_f1", "Dance wine 13", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint14"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_b_f02", "Dance joint 14", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer27"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_b_m01", "Dance beer 27", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer28"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_b_m02", "Dance beer 28", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig20"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_b_m03", "Dance cig 20", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky15"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_b_m04", "Dance whisky 15", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine14"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_c_f1", "Dance wine 14", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint15"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_c_f02", "Dance joint 15", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer29"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_c_m01", "Dance beer 29", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer30"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_c_m02", "Dance beer 30", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig21"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_c_m03", "Dance cig 22", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky16"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_c_m04", "Dance whisky 16", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint16"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_idle_d_f02", "Dance joint 16", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine15"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_loop_f1", "Dance wine 15", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint17"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_loop_f02", "Dance joint 17", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer31"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_loop_m01", "Dance beer 31", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer32"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_loop_m02", "Dance beer 32", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig23"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_loop_m03", "Dance cig 23", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky17"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_loop_m04", "Dance whisky 17", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine16"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_li_f1", "Dance wine 16", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint18"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_li_f02", "Dance joint 18", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer33"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_li_m01", "Dance beer 33", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer34"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_li_m02", "Dance beer 34", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig24"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_li_m03", "Dance cig 24", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky18"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_li_m04", "Dance whisky 18", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine17"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_mi_drop_f1", "Dance wine 17", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint19"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_mi_drop_f02", "Dance joint 19", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky19"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_mi_drop_m04", "Dance whisky 19", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["djoint20"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_mi_f02", "Dance joint 20", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer35"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_mi_m01", "Dance beer 35", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer36"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_mi_m02", "Dance beer 36", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcig25"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "ti_to_mi_m03", "Dance cig 25", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky20"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "li_idle_a_m04", "Dance whisky 20", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky21"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "li_idle_b_m04", "Dance whisky 21", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky22"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "li_idle_c_m04", "Dance whisky 22", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky23"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "li_loop_m04", "Dance whisky 23", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky24"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "li_to_mi_m04", "Dance whisky 24", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky25"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "li_to_ti_m04", "Dance whisky 25", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky26"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "mi_idle_a_m04", "Dance whisky 26", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky27"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "mi_idle_b_m04", "Dance whisky 27", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky28"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "mi_idle_c_m04", "Dance whisky 28", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky29"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "mi_loop_m04", "Dance whisky 29", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky30"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "mi_to_li_m04", "Dance whisky 30", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky31"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "mi_to_ti_m04", "Dance whisky 31", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky32"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "ti_idle_a_m04", "Dance whisky 32", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky33"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "ti_idle_b_m04", "Dance whisky 33", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky34"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "ti_idle_c_m04", "Dance whisky 34", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky35"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "ti_loop_m04", "Dance whisky 35", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky36"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "ti_to_li_m04", "Dance whisky 36", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwhisky37"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "ti_to_mi_drop_m04", "Dance whisky 37", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine18"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^1", "Dance wine 18", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail01"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^2", "Dance cocktail 01", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine19"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^3", "Dance wine 19", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail02"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^4", "Dance cocktail 02", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail03"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^5", "Dance cocktail 03", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail04"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^6", "Dance cocktail 04", AnimationOptions =
        {
            Prop = 'prop_drink_champ',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.02, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer37"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^1", "Dance beer 37", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer38"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^2", "Dance beer 38", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer39"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^3", "Dance beer 39", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer40"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^4", "Dance beer 40", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.10, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer41"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^5", "Dance beer 41", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer42"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^6", "Dance beer 42", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine20"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_female^1", "Dance wine 20", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail05"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_female^2", "Dance cocktail 05", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine21"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_female^3", "Dance wine 21", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail06"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_female^4", "Dance cocktail 06", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail07"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_female^5", "Dance cocktail 07", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail08"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_female^6", "Dance cocktail 08", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer43"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_male^1", "Dance beer 43", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer44"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_male^2", "Dance beer 44", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer45"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_male^3", "Dance beer 45", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer46"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_male^4", "Dance beer 46", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer47"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_male^5", "Dance beer 47", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer48"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_11_v1_male^6", "Dance beer 48", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail09"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_female^1", "Dance cocktail 09", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail10"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_female^2", "Dance cocktail 10", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail11"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_female^3", "Dance cocktail 11", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.10, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail12"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_female^4", "Dance cocktail 12", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail13"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_female^5", "Dance cocktail 13", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail14"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_female^6", "Dance cocktail 14", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer49"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_male^1", "Dance beer 49", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer50"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_male^2", "Dance beer 50", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer51"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_male^3", "Dance beer 51", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer52"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_male^4", "Dance beer 52", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer53"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_male^5", "Dance beer 53", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer54"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v1_male^6", "Dance beer 54", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine22"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_female^1", "Dance wine 22", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail15"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_female^2", "Dance cocktail 15", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine23"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_female^3", "Dance wine 23", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail16"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_female^4", "Dance cocktail 16", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail17"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_female^5", "Dance cocktail 17", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail18"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_female^6", "Dance cocktail 18", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer55"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_male^1", "Dance beer 55", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer56"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_male^2", "Dance beer 56", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer57"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_male^3", "Dance beer 57", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer58"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_male^4", "Dance beer 58", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer59"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_male^5", "Dance beer 59", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer60"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_13_v2_male^6", "Dance beer 60", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine24"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_female^1", "Dance wine 24", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail19"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_female^2", "Dance cocktail 19", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine25"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_female^3", "Dance wine 25", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail20"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_female^4", "Dance cocktail 20", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail21"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_female^5", "Dance cocktail 21", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail22"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_female^6", "Dance cocktail 22", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer61"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_male^1", "Dance beer 61", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer62"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_male^2", "Dance beer 62", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer63"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_male^3", "Dance beer 63", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer64"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_male^4", "Dance beer 64", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer65"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_male^5", "Dance beer 65", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer66"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_15_v1_male^6", "Dance beer 66", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine26"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_female^1", "Dance wine 26", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail23"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_female^2", "Dance cocktail 23", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine27"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_female^3", "Dance wine 27", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail24"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_female^4", "Dance cocktail 24", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail25"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_female^5", "Dance cocktail 25", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail26"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_female^6", "Dance cocktail 26", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer67"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_male^1", "Dance beer 67", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer68"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_male^2", "Dance beer 68", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer69"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_male^3", "Dance beer 69", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer70"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_male^4", "Dance beer 70", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer71"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_male^5", "Dance beer 71", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer72"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "hi_dance_prop_17_v1_male^6", "Dance beer 72", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine28"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_female^1", "Dance wine 28", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail27"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_female^2", "Dance cocktail 27", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine29"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_female^3", "Dance wine 29", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail28"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_female^4", "Dance cocktail 28", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail29"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_female^5", "Dance cocktail 29", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail30"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_female^6", "Dance cocktail 30", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer73"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_male^1", "Dance beer 73", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer74"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_male^2", "Dance beer 74", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer75"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_male^3", "Dance beer 75", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer76"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_male^4", "Dance beer 76", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer77"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_male^5", "Dance beer 77", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer78"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_09_v1_male^6", "Dance beer 78", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine30"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_female^1", "Dance wine 30", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail31"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_female^2", "Dance cocktail 31", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine31"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_female^3", "Dance wine 31", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail32"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_female^4", "Dance cocktail 32", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail33"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_female^5", "Dance cocktail 33", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail34"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_female^6", "Dance cocktail 34", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer79"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_male^1", "Dance beer 79", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer80"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_male^2", "Dance beer 80", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer81"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_male^3", "Dance beer 81", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer82"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_male^4", "Dance beer 82", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer83"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_male^5", "Dance beer 83", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer84"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_11_v1_male^6", "Dance beer 84", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine32"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_female^1", "Dance wine 32", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail35"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_female^2", "Dance cocktail 35", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine33"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_female^3", "Dance wine 33", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail36"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_female^4", "Dance cocktail 36", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail37"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_female^5", "Dance cocktail 37", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail38"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_female^6", "Dance cocktail 38", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer85"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_male^1", "Dance beer 85", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer86"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_male^2", "Dance beer 86", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer87"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_male^3", "Dance beer 87", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer88"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_male^4", "Dance beer 88", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer89"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_male^5", "Dance beer 89", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer90"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v1_male^6", "Dance beer 90", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine34"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_female^1", "Dance wine 34", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail39"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_female^2", "Dance cocktail 39", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine35"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_female^3", "Dance wine 35", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail40"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_female^4", "Dance cocktail 40", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail41"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_female^5", "Dance cocktail 41", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail42"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_female^6", "Dance cocktail 42", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer91"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_male^1", "Dance beer 91", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer92"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_male^2", "Dance beer 92", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer93"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_male^3", "Dance beer 93", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer94"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_male^4", "Dance beer 94", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer95"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_male^5", "Dance beer 95", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer96"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_13_v2_male^6", "Dance beer 96", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine36"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_female^1", "Dance wine 36", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail43"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_female^2", "Dance cocktail 43", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine37"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_female^3", "Dance wine 37", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail44"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_female^4", "Dance cocktail 44", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail45"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_female^5", "Dance cocktail 45", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail46"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_female^6", "Dance cocktail 46", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer93"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_male^1", "Dance beer 93", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer94"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_male^2", "Dance beer 94", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer95"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_male^3", "Dance beer 95", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer96"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_male^4", "Dance beer 96", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer97"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_male^5", "Dance beer 97", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dbeer98"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_15_v1_male^6", "Dance beer 98", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.15, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine38"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_17_v1_female^1", "Dance wine 38", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail47"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_17_v1_female^2", "Dance cocktail 47", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine39"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_17_v1_female^3", "Dance wine 39", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail48"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_17_v1_female^4", "Dance cocktail 48", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail49"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_17_v1_female^5", "Dance cocktail 49", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail50"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "li_dance_prop_17_v1_female^6", "Dance cocktail 50", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine40"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_09_v1_female^1", "Dance wine 40", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail51"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_09_v1_female^2", "Dance cocktail 51", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine41"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_09_v1_female^3", "Dance wine 41", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail52"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_09_v1_female^4", "Dance cocktail 52", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail53"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_09_v1_female^5", "Dance cocktail 53", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail54"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_09_v1_female^6", "Dance cocktail 54", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine42"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_11_v1_female^1", "Dance wine 42", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail55"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_11_v1_female^2", "Dance cocktail 55", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine43"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_11_v1_female^3", "Dance wine 43", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail56"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_11_v1_female^4", "Dance cocktail 56", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail57"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_11_v1_female^5", "Dance cocktail 57", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail58"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_11_v1_female^6", "Dance cocktail 58", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine44"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_female^1", "Dance wine 44", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail59"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_female^2", "Dance cocktail 59", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine45"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_female^3", "Dance wine 45", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail60"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_female^4", "Dance cocktail 60", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail61"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_female^5", "Dance cocktail 61", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail62"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_female^6", "Dance cocktail 62", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine46"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v2_female^1", "Dance wine 46", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail63"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v2_female^2", "Dance cocktail 63", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine47"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v2_female^3", "Dance wine 47", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail64"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v2_female^4", "Dance cocktail 64", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail65"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v2_female^5", "Dance cocktail 65", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail66"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v2_female^6", "Dance cocktail 66", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine48"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_15_v1_female^1", "Dance wine 48", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail67"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_15_v1_female^2", "Dance cocktail 67", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine49"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_15_v1_female^3", "Dance wine 49", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail68"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_15_v1_female^4", "Dance cocktail 68", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail69"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_15_v1_female^5", "Dance cocktail 69", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail70"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_15_v1_female^6", "Dance cocktail 70", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine50"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_17_v1_female^1", "Dance wine 50", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail71"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_17_v1_female^2", "Dance cocktail 71", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine51"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_17_v1_female^3", "Dance wine 51", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail72"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_17_v1_female^4", "Dance cocktail 72", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail73"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_17_v1_female^5", "Dance cocktail 73", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail74"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_17_v1_female^6", "Dance cocktail 74", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine52"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_li_09_v1_female^1", "Dance wine 52", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail75"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_li_09_v1_female^2", "Dance cocktail 75", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine53"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_li_09_v1_female^3", "Dance wine 53", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail76"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_li_09_v1_female^4", "Dance cocktail 76", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail77"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_li_09_v1_female^5", "Dance cocktail 77", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail78"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_li_09_v1_female^6", "Dance cocktail 78", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine54"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_09_v1_female^1", "Dance wine 54", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail79"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_09_v1_female^2", "Dance cocktail 79", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine55"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_09_v1_female^3", "Dance wine 55", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail80"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_09_v1_female^4", "Dance cocktail 80", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail81"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_09_v1_female^5", "Dance cocktail 81", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail82"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_09_v1_female^6", "Dance cocktail 82", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine56"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_11_v1_female^1", "Dance wine 56", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail83"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_11_v1_female^2", "Dance cocktail 83", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine57"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_11_v1_female^3", "Dance wine 57", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail84"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_11_v1_female^4", "Dance cocktail 84", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail85"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_11_v1_female^5", "Dance cocktail 85", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dcocktail86"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_hi_to_mi_11_v1_female^6", "Dance cocktail 86", AnimationOptions =
        {
            Prop = 'prop_cocktail_glass',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine58"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_li_to_hi_07_v1_female^1", "Dance wine 58", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine59"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_li_to_hi_07_v1_female^3", "Dance wine 59", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine60"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_li_to_mi_11_v1_female^1", "Dance wine 60", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine61"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_li_to_mi_11_v1_female^3", "Dance wine 61", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine62"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_mi_to_hi_11_v1_female^1", "Dance wine 62", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine63"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_mi_to_hi_11_v1_female^3", "Dance wine 63", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine64"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_mi_to_li_11_v1_female^1", "Dance wine 64", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["dwine65"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props_transitions@", "trans_dance_prop_mi_to_li_11_v1_female^3", "Dance wine 65", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
}

DP.CrazyDan = {
    ["lapdance5"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p1", "ld_girl_a_song_a_p1_f", "Lapdance 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lapdance4"] = {"mini@strip_club@idles@stripper", "stripper_idle_02", "Lapdance 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lapdance3"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p2", "ld_girl_a_song_a_p2_f", "Lapdance 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lapdance2"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p3", "ld_girl_a_song_a_p3_f", "Lapdance 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lapdance"] = {"mini@strip_club@private_dance@part1", "priv_dance_p1", "Lapdance", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["horse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_06_base_laz", "Horse 01", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse02"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_06_base_v2_laz", "Horse 02", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse03"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_raiseup_laz", "Horse 03", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse04"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_13_shimmyhump_laz", "Horse 04", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse05"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_13_suckit_laz", "Horse 05", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse06"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_15_buckingbronco_laz", "Horse 06", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse07"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_15_shimmyya_laz", "Horse 07", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse08"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_17_highhorse_laz", "Horse 08", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse09"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_17_spinaround_laz", "Horse 09", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse10"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_mi_06_base_laz", "Horse 10", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse11"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_mi_11_spankthat_laz", "Horse 11", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse12"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_mi_13_baselong_laz", "Horse 12", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse13"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_mi_13_lookaround_laz", "Horse 13", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse14"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_mi_15_handsup_laz", "Horse 14", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse15"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_mi_15_raiseup_laz", "Horse 15", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse16"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_mi_17_buckingbronco_laz", "Horse 16", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse17"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_mi_17_talking_laz", "Horse 17", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse18"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_hi_05_dlg_cuberoot_laz", "Horse 18", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse19"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_hi_05_dlg_havingit_laz", "Horse 19", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse20"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_hi_05_dlg_highaf_laz", "Horse 20", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse21"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_hi_05_dlg_ridegurl_laz", "Horse 21", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse22"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_hi_07_dlg_back288_laz", "Horse 22", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse23"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_hi_07_dlg_whooyeeha_laz", "Horse 23", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse24"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_hi_11_dlg_specialk_laz", "Horse 24", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse25"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_06_base_laz", "Horse 25", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse26"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_06_base_v2_laz", "Horse 26", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse27"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Horse 27", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse28"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_shimmy_laz", "Horse 28", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse29"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_13_holdhead_laz", "Horse 29", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse30"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_13_smackthat_laz", "Horse 30", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse31"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Horse 31", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse32"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_pethorse_laz", "Horse 32", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse33"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_17_headtrophy_laz", "Horse 33", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse34"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_17_poledance_laz", "Horse 34", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse35"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_trans_07_hi_to_li_laz", "Horse 35", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse36"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_trans_07_hi_to_mi_laz", "Horse 36", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse37"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_trans_07_li_to_hi_laz", "Horse 37", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse38"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_trans_07_li_to_mi_laz", "Horse 38", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse39"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_trans_07_mi_to_hi_laz", "Horse 39", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["horse40"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_trans_07_mi_to_li_laz", "Horse 40", AnimationOptions =
        {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    
    
    ["glowstick"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_06_mi_hi_base_laz", "Glowstick", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick02"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_06_li_mi_base_v2_laz", "Glowstick 02", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick03"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_06_mi_hi_base_v2_laz", "Glowstick 03", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick04"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_07_li_mi_to_mi_hi_laz", "Glowstick 04", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick05"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_07_mi_hi_to_li_mi_laz", "Glowstick 05", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick06"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_li_mi_smellthat_laz", "Glowstick 06", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick07"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Glowstick 07", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick08"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_10_li_mi_fishingpole_laz", "Glowstick 08", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick09"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_10_mi_hi_crotchhold_laz", "Glowstick 09", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick10"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_11_li_mi_handsup_laz", "Glowstick 10", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick11"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_11_mi_hi_pointingcrowd_laz", "Glowstick 11", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick12"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_li_mi_shimmy_laz", "Glowstick 12", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick13"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Glowstick 13", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick14"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_li_mi_lookaround_laz", "Glowstick 14", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    ["glowstick15"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Glowstick 15", AnimationOptions =
        {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {0.0700, 0.1400, 0.0, -80.0, 20.0},
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {0.0700, 0.0900, 0.0, -120.0, -20.0},
            EmoteLoop = true,
        }},
    
    ["poledance50"] = {"mini@strip_club@private_dance@exit", "priv_dance_exit", "Poledance 50", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance51"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Poledance 51", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance52"] = {"mini@strip_club@private_dance@part1", "priv_dance_p1", "Poledance 52", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance53"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Poledance 53", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance54"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Poledance 54", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance55"] = {"mini@strip_club@lap_dance_2g@ld_2g_accept", "ld_2g_accept_s1", "Poledance 55", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance56"] = {"mini@strip_club@lap_dance_2g@ld_2g_accept", "ld_2g_accept_s2", "Poledance 56", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance57"] = {"mini@strip_club@lap_dance_2g@ld_2g_approach", "ld_2g_approach_s2", "Poledance 57", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance58"] = {"mini@strip_club@lap_dance_2g@ld_2g_intro", "ld_2g_intro_s2", "Poledance 58", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance59"] = {"mini@strip_club@lap_dance_2g@ld_2g_p1", "ld_2g_p1_s2", "Poledance 59", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance60"] = {"mini@strip_club@lap_dance_2g@ld_2g_p1", "ld_2g_p1_s1", "Poledance 60", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance61"] = {"mini@strip_club@lap_dance_2g@ld_2g_p2", "ld_2g_p2_s1", "Poledance 61", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance62"] = {"mini@strip_club@lap_dance_2g@ld_2g_p2", "ld_2g_p2_s2", "Poledance 62", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance63"] = {"mini@strip_club@lap_dance_2g@ld_2g_p3", "ld_2g_p3_s1", "Poledance 63", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance64"] = {"mini@strip_club@lap_dance_2g@ld_2g_p3", "ld_2g_p3_s2", "Poledance 64", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["poledance65"] = {"mini@strip_club@lap_dance_2g@ld_2g_wait", "ld_2g_wait_s1", "Poledance 65", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["driver"] = {"anim@mp_player_intcelebrationfemale@driver", "driver", "Driver", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["runner"] = {"anim@mp_player_intcelebrationfemale@runner", "runner", "Runner", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["shooting"] = {"anim@mp_player_intcelebrationfemale@shooting", "shooting", "Shooting", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["suckit"] = {"anim@mp_player_intcelebrationfemale@suck_it", "suck_it", "Suck it", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["takeselfie"] = {"anim@mp_player_intcelebrationfemale@take_selfie", "take_selfie", "Take selfie", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crowdinvitation"] = {"anim@mp_player_intcelebrationmale@crowd_invitation", "crowd_invitation", "Crowd invitation", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["driver2"] = {"anim@mp_player_intcelebrationmale@driver", "driver", "Driver 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["runner2"] = {"anim@mp_player_intcelebrationmale@runner", "runner", "Runner 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["shooting2"] = {"anim@mp_player_intcelebrationmale@shooting", "shooting", "Shooting 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["invitation"] = {"anim@mp_player_intuppercrowd_invitation", "idle_a", "Invitation", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    
    ["crazy01"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "idle_a", "Crazy 01", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy02"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "idle_b", "Crazy 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy03"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "idle_c", "Crazy 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy04"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "idle_d", "Crazy 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy05"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "idle_e", "Crazy 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy06"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "idle_f", "Crazy 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy07"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "idle_g", "Crazy 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy08"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "idle_h", "Crazy 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy09"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6", "idle_a", "Crazy 09", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy10"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "base_idle_a", "Crazy 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy11"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "base_idle_b", "Crazy 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy12"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "base_idle_c", "Crazy 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy13"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "base_idle_d", "Crazy 13", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy14"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "base_idle_e", "Crazy 14", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crazy15"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "base_idle_f", "Crazy 15", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["bangingtunes12"] = {"anim@mp_player_intcelebrationfemale@banging_tunes_left", "banging_tunes", "Banging tunes 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes11"] = {"anim@mp_player_intcelebrationfemale@banging_tunes_right", "banging_tunes", "Banging tunes 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes10"] = {"anim@mp_player_intcelebrationfemale@banging_tunes", "banging_tunes", "Banging tunes 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["catscradle4"] = {"anim@mp_player_intcelebrationfemale@cats_cradle", "cats_cradle", "Cats cradle 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["findthefish4"] = {"anim@mp_player_intcelebrationfemale@find_the_fish", "find_the_fish", "Find the fish 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["heartpumping4"] = {"anim@mp_player_intcelebrationfemale@heart_pumping", "heart_pumping", "Heart pumping 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["ohsnap4"] = {"anim@mp_player_intcelebrationfemale@oh_snap", "oh_snap", "Oh snap 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["raisetheroof"] = {"anim@mp_player_intcelebrationfemale@raise_the_roof", "raise_the_roof", "Raise the roof 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["salsaroll4"] = {"anim@mp_player_intcelebrationfemale@salsa_roll", "salsa_roll", "Salsa roll 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["uncledisco4"] = {"anim@mp_player_intcelebrationfemale@uncle_disco", "uncle_disco", "Uncle disco 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes09"] = {"anim@mp_player_intcelebrationmale@banging_tunes_left", "banging_tunes", "Banging tunes 09", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes08"] = {"anim@mp_player_intcelebrationmale@banging_tunes_right", "banging_tunes", "Banging tunes 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes07"] = {"anim@mp_player_intcelebrationmale@banging_tunes", "banging_tunes", "Banging tunes 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["catscradle3"] = {"anim@mp_player_intcelebrationmale@cats_cradle", "cats_cradle", "Cats cradle 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["findthefish3"] = {"anim@mp_player_intcelebrationmale@find_the_fish", "find_the_fish", "Find the fish 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["heartpumping3"] = {"anim@mp_player_intcelebrationmale@heart_pumping", "heart_pumping", "Heart pumping 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["ohsnap3"] = {"anim@mp_player_intcelebrationmale@oh_snap", "oh_snap", "Oh snap 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["raisetheroof3"] = {"anim@mp_player_intcelebrationmale@raise_the_roof", "raise_the_roof", "Raise the roof 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["salsaroll3"] = {"anim@mp_player_intcelebrationmale@salsa_roll", "salsa_roll", "Salsa roll 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["uncledisco3"] = {"anim@mp_player_intcelebrationmale@uncle_disco", "uncle_disco", "Uncle disco 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["can-can"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "can-can_in_here", "Can-can", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["daveyisthelife"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "davey_is_the_life_and_soul", "Davey is the life", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["manofthematch"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "man_of_the_match_right_here", "Man of the match", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["niceone"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "nice_one_nice_one", "Nice one", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["nudgewink"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "nudge_nudge_wink_wink", "Nudge wink", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["rightout"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "right_out_of_the_gate", "Right out", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["rightup"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "right_up_my_alley", "Right up", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["thistune"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "this_tune_has_the_same_bpm", "This tune", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["wellyon"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage1_ig5", "welly_on_the_decks", "Welly on", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes06"] = {"anim@mp_player_intcelebrationfemale@banging_tunes_left", "banging_tunes", "Banging tunes 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes05"] = {"anim@mp_player_intcelebrationfemale@banging_tunes_right", "banging_tunes", "Banging tunes 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes04"] = {"anim@mp_player_intcelebrationfemale@banging_tunes", "banging_tunes", "Banging tunes 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["catscradle2"] = {"anim@mp_player_intcelebrationfemale@cats_cradle", "cats_cradle", "Cats cradle 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["findthefish2"] = {"anim@mp_player_intcelebrationfemale@find_the_fish", "find_the_fish", "Find the fish 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["heartpumping2"] = {"anim@mp_player_intcelebrationfemale@heart_pumping", "heart_pumping", "Heart pumping 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["ohsnap2"] = {"anim@mp_player_intcelebrationfemale@oh_snap", "oh_snap", "Oh snap2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["raisetheroof2"] = {"anim@mp_player_intcelebrationfemale@raise_the_roof", "raise_the_roof", "Raise the roof 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["salsaroll2"] = {"anim@mp_player_intcelebrationfemale@salsa_roll", "salsa_roll", "Salsa roll 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["uncledisco2"] = {"anim@mp_player_intcelebrationfemale@uncle_disco", "uncle_disco", "Uncle disco 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes01"] = {"anim@mp_player_intcelebrationmale@banging_tunes_left", "banging_tunes", "Banging tunes 01", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes02"] = {"anim@mp_player_intcelebrationmale@banging_tunes_right", "banging_tunes", "Banging tunes 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bangingtunes03"] = {"anim@mp_player_intcelebrationmale@banging_tunes", "banging_tunes", "Banging tunes 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["catscradle"] = {"anim@mp_player_intcelebrationmale@cats_cradle", "cats_cradle", "Cats cradle", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["findthefish"] = {"anim@mp_player_intcelebrationmale@find_the_fish", "find_the_fish", "Find the fish", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["heartpumping"] = {"anim@mp_player_intcelebrationmale@heart_pumping", "heart_pumping", "Heart pumping", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["ohsnap"] = {"anim@mp_player_intcelebrationmale@oh_snap", "oh_snap", "Oh snap", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["raisetheroof"] = {"anim@mp_player_intcelebrationmale@raise_the_roof", "raise_the_roof", "Raise the roof", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["salsaroll"] = {"anim@mp_player_intcelebrationmale@salsa_roll", "salsa_roll", "Salsa roll", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["uncledisco"] = {"anim@mp_player_intcelebrationmale@uncle_disco", "uncle_disco", "Uncle disco", AnimationOptions =
        {
            EmoteLoop = true,
        }},
}

DP.SideDan = {
    ["dside001"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Dance 001", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside002"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_down", "Dance 002", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside003"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance 003", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside004"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_left", "Dance 004", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside005"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_left_down", "Dance 005", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside006"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_left_up", "Dance 006", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside007"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_right", "Dance 007", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside008"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_right_down", "Dance 008", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside009"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_right_up", "Dance 009", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside010"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Dance 010", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside011"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Dance 011", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside012"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_up", "Dance 012", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside013"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_left", "Dance 013", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside014"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_left_down", "Dance 014", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside015"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_left_up", "Dance 015", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside016"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_right", "Dance 016", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside017"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_right_down", "Dance 017", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside018"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_right_up", "Dance 018", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside019"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center", "Dance 019", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside020"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_down", "Dance 020", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside021"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Dance 021", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside022"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_left", "Dance 022", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside023"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_left_down", "Dance 023", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside024"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_left_up", "Dance 024", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside025"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_right", "Dance 025", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside026"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_right_down", "Dance 026", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside027"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_right_up", "Dance 027", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside028"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Dance 028", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside029"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_down", "Dance 029", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside030"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dance 030", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside031"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_left", "Dance 031", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside032"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_left_down", "Dance 032", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside033"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_left_up", "Dance 033", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside034"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_right", "Dance 034", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside035"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_right_down", "Dance 035", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside036"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_right_up", "Dance 036", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside037"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Dance 037", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside038"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Dance 038", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside039"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_up", "Dance 039", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside040"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_left", "Dance 040", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside041"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_left_down", "Dance 041", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside042"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_left_up", "Dance 042", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside043"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_right", "Dance 043", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside044"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_right_down", "Dance 044", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside045"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_right_up", "Dance 045", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside046"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_center", "Dance 046", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside047"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_center_down", "Dance 047", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside048"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_center_up", "Dance 048", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside049"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_left", "Dance 049", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside050"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_left_down", "Dance 050", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside051"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_left_up", "Dance 051", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside052"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_right", "Dance 052", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside053"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_right_down", "Dance 053", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside054"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_right_up", "Dance 054", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside055"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_center", "Dance 055", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside056"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_center_down", "Dance 056", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside057"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance 057", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside058"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_left", "Dance 058", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside059"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_left_down", "Dance 059", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside060"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_left_up", "Dance 060", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside061"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_right", "Dance 061", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside062"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_right_down", "Dance 062", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside063"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_right_up", "Dance 063", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside064"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_center", "Dance 064", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside065"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_center_down", "Dance 065", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside066"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_center_up", "Dance 066", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside067"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_left", "Dance 067", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside068"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_left_down", "Dance 068", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside069"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_left_up", "Dance 069", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside070"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_right", "Dance 070", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside071"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_right_down", "Dance 071", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside072"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_right_up", "Dance 072", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside073"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Dance 073", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside074"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center_down", "Dance 074", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside075"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center_up", "Dance 075", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside076"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_left", "Dance 076", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside077"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_left_down", "Dance 077", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside078"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_left_up", "Dance 078", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside079"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_right", "Dance 079", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside080"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_right_down", "Dance 080", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside081"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_right_up", "Dance 081", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside082"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Dance 082", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside083"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center_down", "Dance 083", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside084"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dance 084", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside085"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_left", "Dance 085", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside086"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_left_down", "Dance 086", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside087"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_left_up", "Dance 087", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside088"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_right", "Dance 088", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside089"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_right_down", "Dance 089", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside090"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_right_up", "Dance 090", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside091"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "low_center", "Dance 091", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside092"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "low_center_down", "Dance 092", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside093"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "low_center_up", "Dance 093", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside094"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "low_left", "Dance 094", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside095"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "low_left_down", "Dance 095", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside096"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "low_left_up", "Dance 096", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside097"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "low_right", "Dance 097", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside098"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "low_right_down", "Dance 098", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside099"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "low_right_up", "Dance 099", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside100"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_center", "Dance 100", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside101"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_center_down", "Dance 101", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside102"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_center_up", "Dance 102", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside103"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_left", "Dance 103", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside104"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_left_down", "Dance 104", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside105"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_left_up", "Dance 105", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside106"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_right", "Dance 106", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside107"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_right_down", "Dance 107", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside108"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "med_right_up", "Dance 108", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside109"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "high_center", "Dance 109", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside110"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "high_center_down", "Dance 110", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside111"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "high_center_up", "Dance 111", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside112"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "high_left", "Dance 112", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside113"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "high_left_down", "Dance 113", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside114"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "high_left_up", "Dance 114", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside115"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "high_right", "Dance 115", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside116"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "high_right_down", "Dance 116", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside117"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "high_right_up", "Dance 117", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside118"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "low_center", "Dance 118", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside119"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "low_center_down", "Dance 119", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside120"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "low_center_up", "Dance 120", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside121"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "low_left", "Dance 121", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside122"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "low_left_down", "Dance 122", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside123"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "low_left_up", "Dance 123", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside124"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "low_right", "Dance 124", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside125"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "low_right_down", "Dance 125", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside126"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "low_right_up", "Dance 126", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside127"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_center", "Dance 127", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside128"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_center_down", "Dance 128", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside129"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_center_up", "Dance 129", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside130"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_left", "Dance 130", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside131"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_left_down", "Dance 131", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside132"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_left_up", "Dance 132", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside133"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_right", "Dance 133", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside134"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_right_down", "Dance 134", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside135"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_right_up", "Dance 135", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside136"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "high_center", "Dance 136", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside137"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "high_center_down", "Dance 137", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside138"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "high_center_up", "Dance 138", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside139"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "high_left", "Dance 139", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside140"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "high_left_down", "Dance 140", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside141"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "high_left_up", "Dance 141", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside142"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "high_right", "Dance 142", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside143"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "high_right_down", "Dance 143", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside144"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "high_right_up", "Dance 144", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside145"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "low_center", "Dance 145", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside146"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "low_center_down", "Dance 146", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside147"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "low_center_up", "Dance 147", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside148"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "low_left", "Dance 148", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside149"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "low_left_down", "Dance 149", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside150"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "low_left_up", "Dance 150", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside151"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "low_right", "Dance 151", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside152"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "low_right_down", "Dance 152", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside153"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "low_right_up", "Dance 153", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside154"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "med_center", "Dance 154", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside155"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "med_center_down", "Dance 155", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside156"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "med_center_up", "Dance 156", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside157"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "med_left", "Dance 157", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside158"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "med_left_down", "Dance 158", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside159"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "med_left_up", "Dance 159", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside160"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "med_right", "Dance 160", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside161"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "med_right_down", "Dance 161", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside162"] = {"anim@amb@nightclub@mini@dance@dance_solo@jumper@", "med_right_up", "Dance 162", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside163"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "high_center", "Dance 163", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside164"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "high_center_down", "Dance 164", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside165"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "high_center_up", "Dance 165", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside166"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "high_left", "Dance 166", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside167"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "high_left_down", "Dance 167", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside168"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "high_left_up", "Dance 168", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside169"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "high_right", "Dance 169", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside170"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "high_right_down", "Dance 170", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside171"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "high_right_up", "Dance 171", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside172"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "low_center", "Dance 172", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside173"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "low_center_down", "Dance 173", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside174"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "low_center_up", "Dance 174", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside175"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "low_left", "Dance 175", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside176"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "low_left_down", "Dance 176", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside177"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "low_left_u", "Dance 177", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside178"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "low_right", "Dance 178", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside179"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "low_right_down", "Dance 179", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside180"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "low_right_up", "Dance 180", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside181"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "med_center", "Dance 181", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside182"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "med_center_down", "Dance 182", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside183"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "med_center_up", "Dance 183", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside184"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "med_left", "Dance 184", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside185"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "med_left_down", "Dance 185", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside186"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "med_left_up", "Dance 186", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside187"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "med_right", "Dance 187", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside188"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "med_right_down", "Dance 188", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside189"] = {"anim@amb@nightclub@mini@dance@dance_solo@sand_trip@", "med_right_up", "Dance 189", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside190"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_center", "Dance 190", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside191"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_center_down", "Dance 191", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside192"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_center_up", "Dance 192", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside193"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_left", "Dance 193", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside194"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_left_down", "Dance 194", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside195"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_left_up", "Dance 195", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside196"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right", "Dance 196", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside197"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_down", "Dance 197", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside198"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_up", "Dance 198", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside199"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "low_center", "Dance 199", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside200"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "low_center_down", "Dance 200", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside201"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "low_center_up", "Dance 201", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside202"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "low_left", "Dance 202", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside203"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "low_left_down", "Dance 203", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside204"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "low_left_up", "Dance 204", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside205"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "low_right", "Dance 205", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside206"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "low_right_down", "Dance 206", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside207"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "low_right_up", "Dance 207", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside208"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_center", "Dance 208", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside209"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_center_down", "Dance 209", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside210"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_center_up", "Dance 210", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside211"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_left", "Dance 211", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside212"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_left_down", "Dance 212", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside213"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_left_up", "Dance 213", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside214"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_right", "Dance 214", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside215"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_right_down", "Dance 215", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside216"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_right_up", "Dance 216", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside217"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "high_center", "Dance 217", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside218"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "high_center_down", "Dance 218", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside219"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "high_center_up", "Dance 219", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside220"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "high_left", "Dance 220", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside221"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "high_left_down", "Dance 221", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside222"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "high_left_up", "Dance 222", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside223"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "high_right", "Dance 223", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside224"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "high_right_down", "Dance 224", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside225"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "high_right_up", "Dance 225", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside226"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "low_center", "Dance 226", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside227"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "low_center_down", "Dance 227", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside228"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "low_center_up", "Dance 228", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside229"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "low_left", "Dance 229", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside230"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "low_left_down", "Dance 230", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside231"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "low_left_up", "Dance 231", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside232"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "low_right", "Dance 232", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside233"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "low_right_down", "Dance 233", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside234"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "low_right_up", "Dance 234", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside235"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "med_center", "Dance 235", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside236"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "med_center_down", "Dance 236", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside237"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "med_center_up", "Dance 237", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside238"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "med_left", "Dance 238", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside239"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "med_left_down", "Dance 239", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside240"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "med_left_up", "Dance 240", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside241"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "med_right", "Dance 241", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside242"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "med_right_down", "Dance 242", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside243"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_karate@", "med_right_up", "Dance 243", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside244"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center", "Dance 244", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside245"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center_down", "Dance 245", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside246"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center_up", "Dance 246", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside247"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_left", "Dance 247", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside248"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_left_down", "Dance 248", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside249"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_left_up", "Dance 249", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside250"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_right", "Dance 250", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside251"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_right_down", "Dance 251", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside252"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_right_up", "Dance 252", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside253"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "low_center", "Dance 253", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside254"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "low_center_down", "Dance 254", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside255"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "low_center_up", "Dance 255", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside256"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "low_left", "Dance 256", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside257"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "low_left_down", "Dance 257", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside258"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "low_left_up", "Dance 258", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside259"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "low_right", "Dance 259", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside260"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "low_right_down", "Dance 260", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside261"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "low_right_up", "Dance 261", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside262"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_center", "Dance 262", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside263"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_center_down", "Dance 263", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside264"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_center_up", "Dance 264", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside265"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_left", "Dance 265", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside266"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_left_down", "Dance 266", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside267"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_left_up", "Dance 267", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside268"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_right", "Dance 268", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside269"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_right_down", "Dance 269", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dside270"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_right_up", "Dance 270", AnimationOptions =
        {
            EmoteLoop = true,
        }},
}


DP.MiDanf = {
    ["dmif001"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^1", "Dance F001", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif002"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^2", "Dance F002", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif003"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^3", "Dance F003", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif004"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^4", "Dance F004", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif005"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^5", "Dance F005", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif006"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^6", "Dance F006", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif007"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^1", "Dance F007", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif008"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^2", "Dance F008", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif009"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^3", "Dance F009", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif010"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^4", "Dance F010", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif011"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^5", "Dance F011", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif012"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^6", "Dance F012", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif013"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^1", "Dance F013", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif014"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^2", "Dance F014", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif015"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^3", "Dance F015", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif016"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^4", "Dance F016", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif017"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^5", "Dance F017", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif018"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^6", "Dance F018", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif019"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_female^1", "Dance F019", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif020"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_female^2", "Dance F020", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif021"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_female^3", "Dance F021", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif022"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_female^4", "Dance F022", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif023"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_female^5", "Dance F023", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif024"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_female^6", "Dance F024", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif025"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^1", "Dance F025", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif026"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^2", "Dance F026", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif027"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^3", "Dance F027", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif028"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^4", "Dance F028", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif029"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^5", "Dance F029", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif030"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^6", "Dance F030", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif031"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^1", "Dance F031", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif032"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^2", "Dance F032", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif033"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^3", "Dance F033", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif034"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^4", "Dance F034", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif035"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^5", "Dance F035", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif036"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^6", "Dance F036", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif037"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^1", "Dance F037", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif038"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^2", "Dance F038", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif039"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^3", "Dance F039", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif040"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^4", "Dance F040", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif041"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^5", "Dance F041", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif042"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^6", "Dance F042", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif043"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^1", "Dance F043", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif044"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^2", "Dance F044", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif045"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^3", "Dance F045", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif046"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^4", "Dance F046", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif047"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^5", "Dance F047", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif048"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^6", "Dance F048", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif049"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^1", "Dance F049", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif050"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^2", "Dance F050", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif051"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^3", "Dance F051", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif052"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^4", "Dance F052", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif053"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^5", "Dance F053", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif054"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^6", "Dance F054", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif055"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^1", "Dance F055", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif056"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^2", "Dance F056", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif057"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^3", "Dance F057", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif058"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^4", "Dance F058", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif059"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^5", "Dance F059", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif060"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^6", "Dance F060", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif061"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^1", "Dance F061", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif062"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^2", "Dance F062", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif063"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^3", "Dance F063", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif064"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^4", "Dance F064", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif065"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^5", "Dance F065", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif066"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^6", "Dance F066", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif067"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^1", "Dance F067", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif068"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^2", "Dance F068", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif069"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^3", "Dance F069", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif070"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^4", "Dance F070", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif071"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^5", "Dance F071", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif072"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^6", "Dance F072", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif073"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_female^1", "Dance F073", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif074"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_female^2", "Dance F074", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif075"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_female^3", "Dance F075", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif076"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_female^4", "Dance F076", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif077"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_female^5", "Dance F077", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif078"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_female^6", "Dance F078", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif079"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^1", "Dance F079", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif080"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^2", "Dance F080", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif081"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^3", "Dance F081", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif082"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^4", "Dance F082", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif083"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^5", "Dance F083", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif084"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^6", "Dance F084", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif085"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^1", "Dance F085", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif086"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^2", "Dance F086", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif087"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^3", "Dance F087", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif088"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^4", "Dance F088", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif089"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^5", "Dance F089", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif090"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^6", "Dance F090", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif091"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^1", "Dance F091", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif092"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^2", "Dance F092", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif093"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^3", "Dance F093", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif094"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^4", "Dance F094", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif095"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^5", "Dance F095", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif096"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^6", "Dance F096", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif097"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^1", "Dance F097", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif098"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^2", "Dance F098", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif099"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^3", "Dance F099", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif100"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^4", "Dance F100", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif101"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^5", "Dance F101", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif102"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^6", "Dance F102", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif103"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^1", "Dance F103", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif104"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^2", "Dance F104", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif105"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^3", "Dance F105", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif106"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^4", "Dance F106", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif107"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^5", "Dance F107", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif108"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^6", "Dance F108", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif109"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_female^1", "Dance F109", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif110"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_female^2", "Dance F110", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif111"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_female^3", "Dance F111", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif112"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_female^4", "Dance F112", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif113"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_female^5", "Dance F113", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif114"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_female^6", "Dance F114", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif115"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_female^1", "Dance F115", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif116"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_female^2", "Dance F116", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif117"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_female^3", "Dance F117", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif118"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_female^4", "Dance F118", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif119"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_female^5", "Dance F119", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif120"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_female^6", "Dance F120", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif121"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_female^1", "Dance F121", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif122"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_female^2", "Dance F122", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif123"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_female^3", "Dance F123", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif124"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_female^4", "Dance F124", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif125"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_female^5", "Dance F125", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif126"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_female^6", "Dance F126", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif127"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_female^1", "Dance F127", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif128"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_female^2", "Dance F128", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif129"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_female^3", "Dance F129", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif130"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_female^4", "Dance F130", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif131"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_female^5", "Dance F131", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif132"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_female^6", "Dance F132", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif133"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_female^1", "Dance F133", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif134"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_female^2", "Dance F134", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif135"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_female^3", "Dance F135", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif136"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_female^4", "Dance F136", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif137"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_female^5", "Dance F137", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif138"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_female^6", "Dance F138", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif139"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_female^1", "Dance F139", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif140"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_female^2", "Dance F140", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif141"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_female^3", "Dance F141", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif142"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_female^4", "Dance F142", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif143"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_female^5", "Dance F143", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif144"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_female^6", "Dance F144", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif145"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_female^1", "Dance F145", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif146"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_female^2", "Dance F146", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif147"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_female^3", "Dance F147", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif148"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_female^4", "Dance F148", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif149"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_female^5", "Dance F149", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif150"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_female^6", "Dance F150", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif151"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_female^1", "Dance F151", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif152"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_female^2", "Dance F152", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif153"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_female^3", "Dance F153", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif154"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_female^4", "Dance F154", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif155"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_female^5", "Dance F155", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif156"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_female^6", "Dance F156", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif157"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_female^1", "Dance F157", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif158"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_female^2", "Dance F158", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif159"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_female^3", "Dance F159", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif160"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_female^4", "Dance F160", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif161"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_female^5", "Dance F161", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif162"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_female^6", "Dance F162", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif163"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_female^1", "Dance F163", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif164"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_female^2", "Dance F164", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif165"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_female^3", "Dance F165", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif166"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_female^4", "Dance F166", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif167"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_female^5", "Dance F167", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif168"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_female^6", "Dance F168", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif169"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^1", "Dance F169", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif170"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^2", "Dance F170", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif171"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^3", "Dance F171", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif172"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^4", "Dance F172", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif173"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^5", "Dance F173", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif174"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^6", "Dance F174", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif175"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^1", "Dance F175", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif176"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^2", "Dance F176", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif177"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^3", "Dance F177", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif178"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^4", "Dance F178", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif179"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^5", "Dance F179", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif180"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^6", "Dance F180", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif181"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^1", "Dance F181", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif182"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^2", "Dance F182", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif183"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^3", "Dance F183", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif184"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^4", "Dance F184", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif185"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^5", "Dance F185", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif186"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^6", "Dance F186", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif187"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^1", "Dance F187", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif188"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^2", "Dance F188", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif189"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^3", "Dance F189", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif190"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^4", "Dance F190", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif191"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^5", "Dance F191", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif192"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^6", "Dance F192", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif193"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_female^1", "Dance F193", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif194"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_female^2", "Dance F194", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif195"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_female^3", "Dance F195", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif196"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_female^4", "Dance F196", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif197"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_female^5", "Dance F197", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif198"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_female^6", "Dance F198", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif199"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^1", "Dance F199", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif200"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^2", "Dance F200", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif201"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^3", "Dance F201", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif202"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^4", "Dance F202", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif203"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^5", "Dance F203", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif204"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^6", "Dance F204", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif205"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^1", "Dance F205", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif206"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^2", "Dance F206", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif207"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^3", "Dance F207", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif208"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^4", "Dance F208", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif209"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^5", "Dance F209", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif210"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^6", "Dance F210", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif211"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^1", "Dance F211", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif212"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^2", "Dance F212", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif213"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^3", "Dance F213", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif214"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^4", "Dance F214", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif215"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^5", "Dance F215", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif216"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^6", "Dance F216", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif217"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^1", "Dance F217", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif218"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^2", "Dance F218", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif219"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^3", "Dance F219", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif220"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^4", "Dance F220", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif221"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^5", "Dance F221", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif222"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^6", "Dance F222", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif223"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^1", "Dance F223", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif224"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^2", "Dance F224", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif225"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^3", "Dance F225", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif226"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^4", "Dance F226", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif227"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^5", "Dance F227", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif228"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^6", "Dance F228", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif229"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^1", "Dance F229", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif230"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^2", "Dance F230", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif231"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^3", "Dance F231", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif232"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^4", "Dance F232", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif233"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^5", "Dance F233", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif234"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_female^6", "Dance F234", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif235"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^1", "Dance F235", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif236"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^2", "Dance F236", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif237"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^3", "Dance F237", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif238"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^4", "Dance F238", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif239"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^5", "Dance F239", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif240"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_female^6", "Dance F240", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif241"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^1", "Dance F241", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif242"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^2", "Dance F242", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif243"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^3", "Dance F243", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif244"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^4", "Dance F244", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif245"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^5", "Dance F245", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif246"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_female^6", "Dance F246", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif247"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^1", "Dance F247", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif248"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^2", "Dance F248", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif249"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^3", "Dance F249", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif250"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^4", "Dance F250", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif251"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^5", "Dance F251", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif252"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_female^6", "Dance F252", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif253"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^1", "Dance F253", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif254"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^2", "Dance F254", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif255"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^3", "Dance F255", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif256"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^4", "Dance F256", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif257"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^5", "Dance F257", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif258"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_female^6", "Dance F258", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif259"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^1", "Dance F259", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif260"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^2", "Dance F260", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif261"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^3", "Dance F261", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif262"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^4", "Dance F262", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif263"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^5", "Dance F263", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif264"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_female^6", "Dance F264", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif265"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^1", "Dance F265", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif266"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^2", "Dance F266", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif267"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^3", "Dance F267", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif268"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^4", "Dance F268", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif269"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^5", "Dance F269", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif270"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_female^6", "Dance F270", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif271"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^1", "Dance F271", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif272"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^2", "Dance F272", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif273"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^3", "Dance F273", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif274"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^4", "Dance F274", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif275"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^5", "Dance F275", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif276"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_female^6", "Dance F276", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif277"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^1", "Dance F277", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif278"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^2", "Dance F278", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif279"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^3", "Dance F279", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif280"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^4", "Dance F280", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif281"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^5", "Dance F281", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif282"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_female^6", "Dance F282", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif283"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_loop_f01", "Dance F283", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif284"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_loop_f02", "Dance F284", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif285"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_b_f01", "Dance F285", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif286"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_b_f02", "Dance F286", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif287"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_a_f01", "Dance F287", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif288"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_a_f02", "Dance F288", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif289"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_c_f01", "Dance F289", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif290"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_c_f02", "Dance F290", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif291"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^1", "Dance F291", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif292"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^2", "Dance F292", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif293"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^3", "Dance F293", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif294"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^4", "Dance F294", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif295"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^5", "Dance F295", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif296"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^6", "Dance F296", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif297"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^1", "Dance F297", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif298"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^2", "Dance F298", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif299"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^3", "Dance F299", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif300"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^4", "Dance F300", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif301"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^5", "Dance F301", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif302"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^6", "Dance F302", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif303"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^1", "Dance F303", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif304"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^2", "Dance F304", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif305"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^3", "Dance F305", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif306"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^4", "Dance F306", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif307"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^5", "Dance F307", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif308"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_female^6", "Dance F308", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif309"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^1", "Dance F309", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif310"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^2", "Dance F310", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif311"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^3", "Dance F311", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif312"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^4", "Dance F312", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif313"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^5", "Dance F313", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif314"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_female^6", "Dance F314", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif315"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^1", "Dance F315", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif316"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^2", "Dance F316", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif317"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^3", "Dance F317", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif318"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^4", "Dance F318", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif319"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^5", "Dance F319", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif320"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_female^6", "Dance F320", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif321"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^1", "Dance F321", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif322"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^2", "Dance F322", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif323"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^3", "Dance F323", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif324"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^4", "Dance F324", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif325"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^5", "Dance F325", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif326"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_female^6", "Dance F326", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif327"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^1", "Dance F327", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif328"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^2", "Dance F328", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif329"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^3", "Dance F329", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif330"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^4", "Dance F330", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif331"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^5", "Dance F331", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif332"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_female^6", "Dance F332", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif333"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^1", "Dance F333", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif334"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^2", "Dance F334", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif335"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^3", "Dance F335", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif336"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^4", "Dance F336", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif337"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^5", "Dance F337", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif338"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_female^6", "Dance F338", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif339"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_female^1", "Dance F339", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif340"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_female^2", "Dance F340", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif341"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_female^3", "Dance F341", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif342"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_female^4", "Dance F342", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif343"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_female^5", "Dance F343", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif344"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_female^6", "Dance F344", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif345"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^1", "Dance F345", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif346"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^2", "Dance F346", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif347"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^3", "Dance F347", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif348"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^4", "Dance F348", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif349"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^5", "Dance F349", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif350"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^6", "Dance F350", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif351"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^1", "Dance F351", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif352"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^2", "Dance F352", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif353"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^3", "Dance F353", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif354"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^4", "Dance F354", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif355"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^5", "Dance F355", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif356"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_female^6", "Dance F356", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif357"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^1", "Dance F357", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif358"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^2", "Dance F358", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif359"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^3", "Dance F359", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif360"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^4", "Dance F360", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif361"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^5", "Dance F361", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif362"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_female^6", "Dance F362", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif363"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^1", "Dance F363", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif364"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^2", "Dance F364", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif365"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^3", "Dance F365", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif366"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^4", "Dance F366", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif367"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^5", "Dance F367", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif368"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_female^6", "Dance F368", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif369"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^1", "Dance F369", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif370"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^2", "Dance F370", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif371"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^3", "Dance F371", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif372"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^4", "Dance F372", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif373"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^5", "Dance F373", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif374"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_female^6", "Dance F374", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif375"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^1", "Dance F375", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif376"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^2", "Dance F376", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif377"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^3", "Dance F377", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif378"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^4", "Dance F378", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif379"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^5", "Dance F379", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif380"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_female^6", "Dance F380", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif381"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^1", "Dance F381", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif382"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^2", "Dance F382", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif383"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^3", "Dance F383", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif384"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^4", "Dance F384", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif385"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^5", "Dance F385", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif386"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_female^6", "Dance F386", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif387"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^1", "Dance F387", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif388"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^2", "Dance F388", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif389"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^3", "Dance F389", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif390"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^4", "Dance F390", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif391"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^5", "Dance F391", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif392"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_female^6", "Dance F392", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif393"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^1", "Dance F393", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif394"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^2", "Dance F394", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif395"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^3", "Dance F395", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif396"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^4", "Dance F396", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif397"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^5", "Dance F397", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif398"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_female^6", "Dance F398", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif399"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_female^1", "Dance F399", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif400"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_female^2", "Dance F400", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif401"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_female^3", "Dance F401", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif402"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_female^4", "Dance F402", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif403"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_female^5", "Dance F403", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif404"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_female^6", "Dance F404", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif405"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_09_v1_female^1", "Dance F405", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif406"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_09_v1_female^2", "Dance F406", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif407"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_09_v2_female^1", "Dance F407", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif408"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_09_v2_female^2", "Dance F408", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif409"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_11_v1_female^1", "Dance F409", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif410"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_11_v1_female^2", "Dance F410", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif411"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_11_v2_female^1", "Dance F411", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif412"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_11_v2_female^2", "Dance F412", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif413"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_13_v1_female^1", "Dance F413", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif414"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_13_v1_female^2", "Dance F414", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif415"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_13_v2_female^1", "Dance F415", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif416"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_13_v2_female^2", "Dance F416", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif417"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_15_v1_female^1", "Dance F417", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif418"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_15_v1_female^2", "Dance F418", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif419"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_15_v2_female^1", "Dance F419", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif420"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_15_v2_female^2", "Dance F420", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif421"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_17_v1_female^1", "Dance F421", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif422"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_17_v1_female^2", "Dance F422", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif423"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_17_v2_female^1", "Dance F423", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif424"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "mi_dance_crowd_17_v2_female^2", "Dance F424", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif425"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_11_v2_female^1", "Dance F425", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif426"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_11_v1_female^1", "Dance F426", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif427"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_09_v2_female^1", "Dance F427", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif428"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_13_v1_female^1", "Dance F428", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif429"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_13_v2_female^1", "Dance F429", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif430"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_09_v1_female^1", "Dance F430", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif431"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_15_v2_female^1", "Dance F431", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif432"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_17_v1_female^1", "Dance F432", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif433"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_17_v1_female^1", "Dance F433", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif434"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_15_v1_female^1", "Dance F434", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif435"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_17_v2_female^1", "Dance F435", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif436"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_17_v1_female^1", "Dance F436", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif437"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_15_v2_female^1", "Dance F437", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif438"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_15_v1_female^1", "Dance F438", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif439"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v2_female^1", "Dance F439", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif440"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v1_female^1", "Dance F440", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif441"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_11_v2_female^1", "Dance F441", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif442"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_11_v1_female^1", "Dance F442", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif443"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_09_v2_female^1", "Dance F443", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif444"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_09_v1_female^1", "Dance F444", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif445"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_17_v2_female^1", "Dance F445", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif446"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_17_v2_female^2", "Dance F446", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif447"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_17_v1_female^1", "Dance F447", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif448"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_17_v1_female^2", "Dance F448", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif449"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_15_v2_female^1", "Dance F449", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif450"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_15_v2_female^2", "Dance F450", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif451"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_15_v1_female^1", "Dance F451", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif452"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_15_v1_female^2", "Dance F452", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif453"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_13_v2_female^1", "Dance F453", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif454"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_13_v2_female^2", "Dance F454", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif455"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_13_v1_female^1", "Dance F455", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif456"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_13_v1_female^2", "Dance F456", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif457"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_11_v2_female^1", "Dance F457", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif458"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_11_v2_female^2", "Dance F458", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif459"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_11_v1_female^1", "Dance F459", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif460"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_11_v1_female^2", "Dance F460", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif461"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_09_v2_female^1", "Dance F461", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif462"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_09_v2_female^2", "Dance F462", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif463"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_09_v1_female^1", "Dance F463", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmif464"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_09_v1_female^2", "Dance F464", AnimationOptions =
        {
            EmoteLoop = true,
        }},
}




DP.HiDanf = {
    ["dhif001"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^1", "Dance F001", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif002"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^2", "Dance F002", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif003"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^3", "Dance F003", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif004"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^4", "Dance F004", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif005"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^5", "Dance F005", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif006"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^6", "Dance F006", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif007"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Dance F007", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif008"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^2", "Dance F008", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif009"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Dance F009", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif010"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^4", "Dance F010", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif011"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^5", "Dance F011", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif012"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^6", "Dance F012", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif013"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^1", "Dance F013", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif014"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^2", "Dance F014", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif015"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^3", "Dance F015", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif016"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^4", "Dance F016", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif017"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^5", "Dance F017", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif018"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^6", "Dance F018", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif019"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_female^1", "Dance F019", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif020"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_female^2", "Dance F020", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif021"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_female^3", "Dance F021", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif022"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_female^4", "Dance F022", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif023"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_female^5", "Dance F023", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif024"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_female^6", "Dance F024", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif025"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^1", "Dance F025", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif026"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^2", "Dance F026", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif027"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^3", "Dance F027", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif028"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^4", "Dance F028", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif029"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^5", "Dance F029", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif030"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^6", "Dance F030", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif031"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^1", "Dance F031", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif032"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^2", "Dance F032", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif033"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^3", "Dance F033", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif034"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^4", "Dance F034", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif035"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^5", "Dance F035", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif036"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^6", "Dance F036", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif037"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^1", "Dance F037", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif038"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^2", "Dance F038", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif039"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^3", "Dance F039", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif040"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^4", "Dance F040", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif041"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^5", "Dance F041", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif042"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^6", "Dance F042", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif043"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_female^1", "Dance F043", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif044"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_female^2", "Dance F044", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif045"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_female^3", "Dance F045", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif046"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_female^4", "Dance F046", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif047"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_female^5", "Dance F047", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif048"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_female^6", "Dance F048", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif049"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^1", "Dance F049", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif050"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^2", "Dance F050", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif051"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^3", "Dance F051", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif052"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^4", "Dance F052", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif053"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^5", "Dance F053", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif054"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^6", "Dance F054", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif055"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^1", "Dance F055", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif056"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^2", "Dance F056", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif057"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^3", "Dance F057", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif058"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^4", "Dance F058", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif059"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^5", "Dance F059", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif060"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^6", "Dance F060", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif061"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_loop_f01", "Dance F061", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif062"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_loop_f02", "Dance F062", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif063"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_f01", "Dance F063", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif064"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_f02", "Dance F064", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif065"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_b_f01", "Dance F065", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif066"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_b_f02", "Dance F066", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif067"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_c_f01", "Dance F067", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif068"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_c_f02", "Dance F068", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif069"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_d_f01", "Dance F069", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif070"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_d_f02", "Dance F070", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif071"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^1", "Dance F071", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif072"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^2", "Dance F072", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif073"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^3", "Dance F073", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif074"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^4", "Dance F074", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif075"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^5", "Dance F075", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif076"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^6", "Dance F076", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif077"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^1", "Dance F077", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif078"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^2", "Dance F078", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif079"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^3", "Dance F079", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif080"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^4", "Dance F080", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif081"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^5", "Dance F081", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif082"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^6", "Dance F082", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif083"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^1", "Dance F083", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif084"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^2", "Dance F084", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif085"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^3", "Dance F085", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif086"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^4", "Dance F086", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif087"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^5", "Dance F087", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif088"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^6", "Dance F088", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif089"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^1", "Dance F089", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif090"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^2", "Dance F090", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif091"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^3", "Dance F091", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif092"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^4", "Dance F092", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif093"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^5", "Dance F093", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif094"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^6", "Dance F094", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif095"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_female^1", "Dance F095", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif096"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_female^2", "Dance F096", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif097"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_female^3", "Dance F097", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif098"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_female^4", "Dance F098", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif099"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_female^5", "Dance F099", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif100"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_female^6", "Dance F100", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif101"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^1", "Dance F101", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif102"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^2", "Dance F102", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif103"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^3", "Dance F103", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif104"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^4", "Dance F104", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif105"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^5", "Dance F105", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif106"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^6", "Dance F106", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif107"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_female^1", "Dance F107", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif108"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_female^2", "Dance F108", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif109"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_female^3", "Dance F109", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif110"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_female^4", "Dance F110", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif111"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_female^5", "Dance F111", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif112"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_female^6", "Dance F112", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif113"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_female^1", "Dance F113", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif114"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_female^2", "Dance F114", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif115"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_female^3", "Dance F115", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif116"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_female^4", "Dance F116", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif117"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_female^5", "Dance F117", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif118"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_female^6", "Dance F118", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif119"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^1", "Dance F119", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif120"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^2", "Dance F120", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif121"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^3", "Dance F121", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif122"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^4", "Dance F122", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif123"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^5", "Dance F123", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif124"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^6", "Dance F124", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif125"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^1", "Dance F125", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif126"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^2", "Dance F126", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif127"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^3", "Dance F127", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif128"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^4", "Dance F128", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif129"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^5", "Dance F129", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif130"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^6", "Dance F130", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif131"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^1", "Dance F131", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif132"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^2", "Dance F132", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif133"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^3", "Dance F133", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif134"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^4", "Dance F134", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif135"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^5", "Dance F135", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif136"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^6", "Dance F136", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif137"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_female^1", "Dance F137", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif138"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_female^2", "Dance F138", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif139"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_female^3", "Dance F139", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif140"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_female^4", "Dance F140", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif141"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_female^5", "Dance F141", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif142"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_female^6", "Dance F142", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif143"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_female^1", "Dance F143", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif144"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_female^2", "Dance F144", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif145"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_female^3", "Dance F145", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif146"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_female^4", "Dance F146", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif147"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_female^5", "Dance F147", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif148"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_female^6", "Dance F148", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif149"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_female^1", "Dance F149", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif150"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_female^2", "Dance F150", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif151"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_female^3", "Dance F151", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif152"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_female^4", "Dance F152", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif153"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_female^5", "Dance F153", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif154"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_female^6", "Dance F154", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif155"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_female^1", "Dance F155", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif156"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_female^2", "Dance F156", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif157"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_female^3", "Dance F157", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif158"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_female^4", "Dance F158", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif159"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_female^5", "Dance F159", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif160"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_female^6", "Dance F160", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif161"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_female^1", "Dance F161", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif162"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_female^2", "Dance F162", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif163"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_female^3", "Dance F163", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif164"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_female^4", "Dance F164", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif165"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_female^5", "Dance F165", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif166"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_female^6", "Dance F166", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif167"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_female^1", "Dance F167", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif168"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_female^2", "Dance F168", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif169"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_female^3", "Dance F169", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif170"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_female^4", "Dance F170", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif171"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_female^5", "Dance F171", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif172"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_female^6", "Dance F172", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif173"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_female^1", "Dance F173", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif174"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_female^2", "Dance F174", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif175"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_female^3", "Dance F175", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif176"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_female^4", "Dance F176", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif177"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_female^5", "Dance F177", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif178"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_female^6", "Dance F178", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif179"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_female^1", "Dance F179", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif180"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_female^2", "Dance F180", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif181"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_female^3", "Dance F181", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif182"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_female^4", "Dance F182", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif183"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_female^5", "Dance F183", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif184"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_female^6", "Dance F184", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif185"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_female^1", "Dance F185", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif186"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_female^2", "Dance F186", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif187"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_female^3", "Dance F187", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif188"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_female^4", "Dance F188", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif189"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_female^5", "Dance F189", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif190"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_female^6", "Dance F190", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif191"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_female^1", "Dance F191", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif192"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_female^2", "Dance F192", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif193"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_female^3", "Dance F193", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif194"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_female^4", "Dance F194", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif195"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_female^5", "Dance F195", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif196"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_female^6", "Dance F196", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif197"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_female^1", "Dance F197", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif198"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_female^2", "Dance F198", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif199"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_female^3", "Dance F199", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif200"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_female^4", "Dance F200", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif201"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_female^5", "Dance F201", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif202"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_female^6", "Dance F202", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif203"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_female^1", "Dance F203", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif204"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_female^2", "Dance F204", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif205"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_female^3", "Dance F205", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif206"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_female^4", "Dance F206", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif207"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_female^5", "Dance F207", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif208"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_female^6", "Dance F208", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif209"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_female^1", "Dance F209", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif210"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_female^2", "Dance F210", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif211"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_female^3", "Dance F211", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif212"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_female^4", "Dance F212", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif213"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_female^5", "Dance F213", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif214"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_female^6", "Dance F214", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif215"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_female^1", "Dance F215", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif216"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_female^2", "Dance F216", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif217"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_female^3", "Dance F217", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif218"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_female^4", "Dance F218", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif219"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_female^5", "Dance F219", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif220"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_female^6", "Dance F220", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif221"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_female^1", "Dance F221", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif222"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_female^2", "Dance F222", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif223"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_female^3", "Dance F223", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif224"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_female^4", "Dance F224", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif225"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_female^5", "Dance F225", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif226"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_female^6", "Dance F226", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif227"] = {"anim@amb@nightclub_island@dancers@club@", "hi_loop_f01", "Dance F227", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif228"] = {"anim@amb@nightclub_island@dancers@club@", "hi_loop_f02", "Dance F228", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif229"] = {"anim@amb@nightclub_island@dancers@club@", "hi_loop_f03", "Dance F229", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif230"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_a_f01", "Dance F230", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif231"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_a_f02", "Dance F231", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif232"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_a_f03", "Dance F232", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif233"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_b_f01", "Dance F233", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif234"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_b_f02", "Dance F234", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif235"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_b_f03", "Dance F235", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif236"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_c_f01", "Dance F236", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif237"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_c_f02", "Dance F237", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif238"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_c_f03", "Dance F238", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif239"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_d_f01", "Dance F239", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif240"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_d_f02", "Dance F240", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif241"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_d_f03", "Dance F241", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif242"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_e_f02", "Dance F242", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif243"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_f_f02", "Dance F243", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif244"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^2", "Dance F244", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif245"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^3", "Dance F245", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif246"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^4", "Dance F246", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif247"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^5", "Dance F247", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif248"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^6", "Dance F248", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif249"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^1", "Dance F249", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif250"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^2", "Dance F250", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif251"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^3", "Dance F251", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif252"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^4", "Dance F252", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif253"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^5", "Dance F253", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif254"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^6", "Dance F254", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif255"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^1", "Dance F255", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif256"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^2", "Dance F256", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif257"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^3", "Dance F257", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif258"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^4", "Dance F258", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif259"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^5", "Dance F259", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif260"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^6", "Dance F260", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif261"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^1", "Dance F261", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif262"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^2", "Dance F262", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif263"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^3", "Dance F263", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif264"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^4", "Dance F264", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif265"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^5", "Dance F265", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif266"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_female^6", "Dance F266", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif267"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^1", "Dance F267", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif268"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^2", "Dance F268", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif269"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^3", "Dance F269", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif270"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^4", "Dance F270", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif271"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^5", "Dance F271", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif272"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_female^6", "Dance F272", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif273"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^1", "Dance F273", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif274"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^2", "Dance F274", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif275"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^3", "Dance F275", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif276"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^4", "Dance F276", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif277"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^5", "Dance F277", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif278"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_female^6", "Dance F278", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif279"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_female^1", "Dance F279", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif280"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_female^2", "Dance F280", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif281"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_female^3", "Dance F281", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif282"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_female^4", "Dance F282", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif283"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_female^5", "Dance F283", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif284"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_female^6", "Dance F284", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif285"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_female^1", "Dance F285", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif286"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_female^2", "Dance F286", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif287"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_female^3", "Dance F287", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif288"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_female^4", "Dance F288", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif289"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_female^5", "Dance F289", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif290"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_female^6", "Dance F290", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif291"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_female^1", "Dance F291", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif292"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_female^2", "Dance F292", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif293"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_female^3", "Dance F293", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif294"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_female^4", "Dance F294", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif295"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_female^5", "Dance F295", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif296"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_female^6", "Dance F296", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif297"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_female^1", "Dance F297", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif298"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_female^2", "Dance F298", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif299"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_female^3", "Dance F299", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif300"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_female^4", "Dance F300", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif301"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_female^5", "Dance F301", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif302"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_female^6", "Dance F302", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif303"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_female^1", "Dance F303", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif304"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_female^2", "Dance F304", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif305"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_female^3", "Dance F305", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif306"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_female^4", "Dance F306", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif307"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_female^5", "Dance F307", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif308"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_female^6", "Dance F308", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif309"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_female^1", "Dance F309", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif310"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_female^2", "Dance F310", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif311"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_female^3", "Dance F311", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif312"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_female^4", "Dance F312", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif313"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_female^5", "Dance F313", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif314"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_female^6", "Dance F314", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif315"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_female^1", "Dance F315", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif316"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_female^2", "Dance F316", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif317"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_female^3", "Dance F317", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif318"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_female^4", "Dance F318", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif319"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_female^5", "Dance F319", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif320"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_female^6", "Dance F320", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif321"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_female^1", "Dance F321", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif322"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_female^2", "Dance F322", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif323"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_female^3", "Dance F323", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif324"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_female^4", "Dance F324", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif325"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_female^5", "Dance F325", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif326"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_female^6", "Dance F326", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif327"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_female^1", "Dance F327", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif328"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_female^2", "Dance F328", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif329"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_female^3", "Dance F329", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif330"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_female^4", "Dance F330", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif331"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_female^5", "Dance F331", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif332"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_female^6", "Dance F332", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif333"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^1", "Dance F333", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif334"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^2", "Dance F334", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif335"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^3", "Dance F335", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif336"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^4", "Dance F336", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif337"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^5", "Dance F337", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif338"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^6", "Dance F338", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif339"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Dance F339", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif340"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^2", "Dance F340", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif341"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Dance F341", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif342"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^4", "Dance F342", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif343"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^5", "Dance F343", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif344"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^6", "Dance F344", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif345"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^1", "Dance F345", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif346"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^2", "Dance F346", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif347"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^3", "Dance F347", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif348"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^4", "Dance F348", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif349"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^5", "Dance F349", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif350"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_female^6", "Dance F350", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif351"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^1", "Dance F351", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif352"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^2", "Dance F352", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif353"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^3", "Dance F353", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif354"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^4", "Dance F354", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif355"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^5", "Dance F355", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif356"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_female^6", "Dance F356", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif357"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^1", "Dance F357", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif358"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^2", "Dance F358", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif359"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^3", "Dance F359", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif360"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^4", "Dance F360", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif361"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^5", "Dance F361", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif362"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_female^6", "Dance F362", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif363"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^1", "Dance F363", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif364"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^2", "Dance F364", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif365"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^3", "Dance F365", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif366"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^4", "Dance F366", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif367"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^5", "Dance F367", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif368"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_female^6", "Dance F368", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif369"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^1", "Dance F369", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif370"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^2", "Dance F370", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif371"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^3", "Dance F371", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif372"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^4", "Dance F372", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif373"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^5", "Dance F373", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif374"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_female^6", "Dance F374", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif375"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^1", "Dance F375", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif376"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^2", "Dance F376", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif377"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^3", "Dance F377", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif378"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^4", "Dance F378", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif379"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^5", "Dance F379", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif380"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_female^6", "Dance F380", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif381"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_female^1", "Dance F381", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif382"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_female^2", "Dance F382", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif383"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_female^3", "Dance F383", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif384"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_female^4", "Dance F384", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif385"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_female^5", "Dance F385", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif386"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_female^6", "Dance F386", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif387"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_female^1", "Dance F387", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif388"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_female^2", "Dance F388", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif389"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_female^3", "Dance F389", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif390"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_female^4", "Dance F390", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif391"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_female^5", "Dance F391", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif392"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_female^6", "Dance F392", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif393"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_female^1", "Dance F393", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif394"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_female^2", "Dance F394", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif395"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_female^3", "Dance F395", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif396"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_female^4", "Dance F396", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif397"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_female^5", "Dance F397", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif398"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_female^6", "Dance F398", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif399"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_09_v1_female^1", "Dance F399", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif400"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_09_v1_female^2", "Dance F400", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif401"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_09_v2_female^1", "Dance F401", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif402"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_09_v2_female^2", "Dance F402", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif403"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_11_v1_female^1", "Dance F403", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif404"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_11_v1_female^2", "Dance F404", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif405"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_11_v2_female^1", "Dance F405", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif406"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_11_v2_female^2", "Dance F406", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif407"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_13_v1_female^1", "Dance F407", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif408"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_13_v1_female^2", "Dance F408", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif409"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_13_v2_female^1", "Dance F409", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif410"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_13_v2_female^2", "Dance F410", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif411"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_15_v1_female^1", "Dance F411", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif412"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_15_v1_female^2", "Dance F412", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif413"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_15_v2_female^1", "Dance F413", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif414"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_15_v2_female^2", "Dance F414", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif415"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_17_v1_female^1", "Dance F415", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif416"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_17_v1_female^2", "Dance F416", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif417"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_17_v2_female^1", "Dance F417", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif418"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "hi_dance_crowd_17_v2_female^2", "Dance F418", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif419"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_09_v1_female^1", "Dance F419", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif420"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_11_v1_female^1", "Dance F420", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif421"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_09_v2_female^1", "Dance F421", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif422"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_13_v1_female^1", "Dance F422", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif423"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_11_v2_female^1", "Dance F423", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif424"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_13_v2_female^1", "Dance F424", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif425"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_15_v1_female^1", "Dance F425", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif426"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_09_v1_female^1", "Dance F426", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif427"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_09_v2_female^1", "Dance F427", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif428"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_11_v1_female^1", "Dance F428", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif429"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_11_v2_female^1", "Dance F429", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif430"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_13_v1_female^1", "Dance F430", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif431"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_15_v1_female^1", "Dance F431", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif432"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_13_v2_female^1", "Dance F432", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif433"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_15_v2_female^1", "Dance F433", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif434"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v1_female^1", "Dance F434", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif435"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v2_female^1", "Dance F435", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif436"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v2_female^1", "Dance F436", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif437"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_17_v1_female^1", "Dance F437", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif438"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_17_v2_female^1", "Dance F438", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif439"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_15_v2_female^1", "Dance F439", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif440"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v2_female^1", "Dance F440", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif441"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v1_female^1", "Dance F441", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif442"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v1_female^2", "Dance F442", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif443"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v2_female^1", "Dance F443", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif444"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v2_female^2", "Dance F444", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif445"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v2_female^2", "Dance F445", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif446"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v1_female^1", "Dance F446", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif447"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v1_female^2", "Dance F447", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif448"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v1_female^1", "Dance F448", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif449"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v1_female^2", "Dance F449", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif450"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v2_female^1", "Dance F450", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif451"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v2_female^2", "Dance F451", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif452"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v1_female^1", "Dance F452", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif453"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v1_female^2", "Dance F453", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif454"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v2_female^1", "Dance F454", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif455"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v2_female^2", "Dance F455", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif456"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v1_female^1", "Dance F456", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif457"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v1_female^2", "Dance F457", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif458"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v2_female^1", "Dance F458", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif459"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v2_female^2", "Dance F459", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif460"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_a_f01", "Dance F460", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif461"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_a_f02", "Dance F461", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif462"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_b_f01", "Dance F462", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif463"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_b_f02", "Dance F463", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif464"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_c_f01", "Dance F464", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif465"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_c_f02", "Dance F465", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif466"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_d_f02", "Dance F466", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif467"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_loop_f01", "Dance F467", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif468"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_loop_f02", "Dance F468", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif469"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_a_f01", "Dance F469", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif470"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_a_f02", "Dance F470", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif471"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_a_f03", "Dance F471", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif472"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_c_f01", "Dance F472", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif473"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_c_f02", "Dance F473", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif474"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_c_f03", "Dance F474", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif475"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_b_f01", "Dance F475", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif476"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_b_f02", "Dance F476", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif477"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_b_f03", "Dance F477", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif478"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_d_f02", "Dance F478", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif479"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_e_f02", "Dance F479", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif480"] = {"anim@amb@nightclub_island@dancers@club@", "ti_loop_f01", "Dance F480", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif481"] = {"anim@amb@nightclub_island@dancers@club@", "ti_loop_f02", "Dance F481", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif482"] = {"anim@amb@nightclub_island@dancers@club@", "ti_loop_f03", "Dance F482", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif483"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_09_v1_female^1", "Dance F483", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif484"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_09_v2_female^1", "Dance F484", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif485"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_11_v1_female^1", "Dance F485", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif486"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_11_v2_female^1", "Dance F486", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif487"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_13_v1_female^1", "Dance F487", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif488"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_15_v1_female^1", "Dance F488", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif489"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_13_v2_female^1", "Dance F489", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif490"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_15_v2_female^1", "Dance F490", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif491"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v1_female^1", "Dance F491", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif492"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v2_female^1", "Dance F492", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif493"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v2_female^1", "Dance F493", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif494"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_17_v1_female^1", "Dance F494", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif495"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_17_v2_female^1", "Dance F495", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif496"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_15_v2_female^1", "Dance F496", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif497"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v1_male^1", "Dance F497", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif498"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v2_male^1", "Dance F498", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif499"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v1_male^1", "Dance F499", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif500"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v2_male^1", "Dance F500", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif501"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v2_female^1", "Dance F501", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif502"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v1_female^1", "Dance F502", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif503"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v1_female^2", "Dance F503", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif504"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v2_female^1", "Dance F504", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif505"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v2_female^2", "Dance F505", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif506"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v2_female^2", "Dance F506", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif507"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v1_female^1", "Dance F507", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif508"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v1_female^2", "Dance F508", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif509"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v1_female^1", "Dance F509", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif510"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v1_female^2", "Dance F510", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif511"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v2_female^1", "Dance F511", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif512"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v2_female^2", "Dance F512", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif513"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v1_female^1", "Dance F513", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif514"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v1_female^2", "Dance F514", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif515"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v2_female^1", "Dance F515", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif516"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v2_female^2", "Dance F516", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif517"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v1_female^1", "Dance F517", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif518"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v1_female^2", "Dance F518", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif519"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v2_female^1", "Dance F519", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhif520"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v2_female^2", "Dance F520", AnimationOptions =
        {
            EmoteLoop = true,
        }},
}


DP.LiDanf = {
    ["dlif001"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^1", "Dance F001", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif002"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^2", "Dance F002", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif003"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^3", "Dance F003", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif004"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^4", "Dance F004", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif005"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^5", "Dance F005", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif006"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^6", "Dance F006", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif007"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^1", "Dance F007", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif008"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^2", "Dance F008", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif009"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^3", "Dance F009", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif010"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^4", "Dance F010", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif011"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^5", "Dance F011", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif012"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^6", "Dance F012", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif013"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^1", "Dance F013", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif014"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^2", "Dance F014", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif015"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^3", "Dance F015", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif016"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^4", "Dance F016", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif017"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^5", "Dance F017", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif018"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^6", "Dance F018", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif019"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^1", "Dance F019", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif020"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^2", "Dance F020", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif021"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^3", "Dance F021", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif022"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^4", "Dance F022", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif023"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^5", "Dance F023", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif024"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^6", "Dance F024", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif025"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^1", "Dance F025", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif026"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^2", "Dance F026", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif027"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^3", "Dance F027", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif028"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^4", "Dance F028", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif029"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^5", "Dance F029", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif030"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^6", "Dance F030", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif031"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^1", "Dance F031", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif032"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^2", "Dance F032", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif033"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^3", "Dance F033", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif034"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^4", "Dance F034", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif035"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^5", "Dance F035", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif036"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^6", "Dance F036", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif037"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^1", "Dance F037", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif038"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^2", "Dance F038", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif039"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^3", "Dance F039", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif040"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^4", "Dance F040", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif041"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^5", "Dance F041", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif042"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^6", "Dance F042", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif043"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^1", "Dance F043", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif044"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^2", "Dance F044", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif045"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^3", "Dance F045", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif046"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^4", "Dance F046", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif047"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^5", "Dance F047", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif048"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^6", "Dance F048", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif049"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^1", "Dance F049", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif050"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^2", "Dance F050", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif051"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^3", "Dance F051", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif052"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^4", "Dance F052", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif053"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^5", "Dance F053", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif054"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^6", "Dance F054", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif055"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^1", "Dance F055", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif056"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^2", "Dance F056", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif057"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^3", "Dance F057", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif058"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^4", "Dance F058", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif059"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^5", "Dance F059", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif060"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^6", "Dance F060", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif061"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^1", "Dance F061", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif062"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^2", "Dance F062", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif063"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^3", "Dance F063", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif064"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^4", "Dance F064", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif065"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^5", "Dance F065", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif066"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^6", "Dance F066", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif067"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^1", "Dance F067", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif068"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^2", "Dance F068", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif069"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^3", "Dance F069", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif070"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^4", "Dance F070", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif071"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^5", "Dance F071", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif072"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^6", "Dance F072", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif073"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^1", "Dance F073", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif074"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^2", "Dance F074", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif075"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^3", "Dance F075", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif076"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^4", "Dance F076", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif077"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^5", "Dance F077", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif078"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^6", "Dance F078", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif079"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^1", "Dance F079", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif080"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^2", "Dance F080", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif081"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^3", "Dance F081", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif082"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^4", "Dance F082", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif083"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^5", "Dance F083", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif084"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^6", "Dance F084", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif085"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^1", "Dance F085", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif086"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^2", "Dance F086", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif087"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^3", "Dance F087", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif088"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^4", "Dance F088", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif089"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^5", "Dance F089", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif090"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^6", "Dance F090", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif091"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^1", "Dance F091", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif092"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^2", "Dance F092", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif093"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^3", "Dance F093", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif094"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^4", "Dance F094", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif095"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^5", "Dance F095", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif096"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^6", "Dance F096", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif097"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^1", "Dance F097", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif098"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^2", "Dance F098", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif099"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^3", "Dance F099", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif100"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^4", "Dance F100", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif101"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^5", "Dance F101", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif102"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^6", "Dance F102", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif103"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^1", "Dance F103", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif104"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^2", "Dance F104", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif105"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^3", "Dance F105", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif106"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^4", "Dance F106", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif107"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^5", "Dance F107", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif108"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^6", "Dance F108", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif109"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_female^1", "Dance F109", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif110"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_female^2", "Dance F110", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif111"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_female^3", "Dance F111", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif112"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_female^4", "Dance F112", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif113"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_female^5", "Dance F113", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif114"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_female^6", "Dance F114", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif115"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_female^1", "Dance F115", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif116"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_female^2", "Dance F116", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif117"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_female^3", "Dance F117", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif118"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_female^4", "Dance F118", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif119"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_female^5", "Dance F119", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif120"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_female^6", "Dance F120", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif121"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_female^1", "Dance F121", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif122"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_female^2", "Dance F122", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif123"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_female^3", "Dance F123", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif124"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_female^4", "Dance F124", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif125"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_female^5", "Dance F125", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif126"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_female^6", "Dance F126", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif127"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_female^1", "Dance F127", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif128"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_female^2", "Dance F128", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif129"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_female^3", "Dance F129", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif130"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_female^4", "Dance F130", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif131"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_female^5", "Dance F131", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif132"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_female^6", "Dance F132", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif133"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_female^1", "Dance F133", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif134"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_female^2", "Dance F134", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif135"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_female^3", "Dance F135", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif136"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_female^4", "Dance F136", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif137"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_female^5", "Dance F137", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif138"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_female^6", "Dance F138", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif139"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_female^1", "Dance F139", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif140"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_female^2", "Dance F140", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif141"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_female^3", "Dance F141", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif142"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_female^4", "Dance F142", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif143"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_female^5", "Dance F143", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif144"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_female^6", "Dance F144", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif145"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_female^1", "Dance F145", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif146"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_female^2", "Dance F146", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif147"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_female^3", "Dance F147", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif148"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_female^4", "Dance F148", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif149"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_female^5", "Dance F149", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif150"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_female^6", "Dance F150", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif151"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_female^1", "Dance F151", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif152"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_female^2", "Dance F152", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif153"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_female^3", "Dance F153", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif154"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_female^4", "Dance F154", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif155"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_female^5", "Dance F155", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif156"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_female^6", "Dance F156", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif157"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_female^1", "Dance F157", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif158"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_female^2", "Dance F158", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif159"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_female^3", "Dance F159", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif160"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_female^4", "Dance F160", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif161"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_female^5", "Dance F161", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif162"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_female^6", "Dance F162", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif163"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_female^1", "Dance F163", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif164"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_female^2", "Dance F164", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif165"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_female^3", "Dance F165", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif166"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_female^4", "Dance F166", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif167"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_female^5", "Dance F167", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif168"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_female^6", "Dance F168", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif169"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_female^1", "Dance F169", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif170"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_female^2", "Dance F170", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif171"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_female^3", "Dance F171", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif172"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_female^4", "Dance F172", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif173"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_female^5", "Dance F173", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif174"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_female^6", "Dance F174", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif175"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_female^1", "Dance F175", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif176"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_female^2", "Dance F176", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif177"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_female^3", "Dance F177", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif178"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_female^4", "Dance F178", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif179"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_female^5", "Dance F179", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif180"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_female^6", "Dance F180", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif181"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_female^1", "Dance F181", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif182"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_female^2", "Dance F182", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif183"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_female^3", "Dance F183", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif184"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_female^4", "Dance F184", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif185"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_female^5", "Dance F185", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif186"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_female^6", "Dance F186", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif187"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_female^1", "Dance F187", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif188"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_female^2", "Dance F188", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif189"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_female^3", "Dance F189", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif190"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_female^4", "Dance F190", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif191"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_female^5", "Dance F191", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif192"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_female^6", "Dance F192", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif193"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_female^1", "Dance F193", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif194"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_female^2", "Dance F194", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif195"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_female^3", "Dance F195", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif196"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_female^4", "Dance F196", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif197"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_female^5", "Dance F197", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif198"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_female^6", "Dance F198", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif199"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_female^1", "Dance F199", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif200"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_female^2", "Dance F200", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif201"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_female^3", "Dance F201", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif202"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_female^4", "Dance F202", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif203"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_female^5", "Dance F203", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif204"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_female^6", "Dance F204", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif205"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_female^1", "Dance F205", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif206"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_female^2", "Dance F206", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif207"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_female^3", "Dance F207", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif208"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_female^4", "Dance F208", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif209"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_female^5", "Dance F209", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif210"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_female^6", "Dance F210", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif211"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_female^1", "Dance F211", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif212"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_female^2", "Dance F212", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif213"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_female^3", "Dance F213", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif214"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_female^4", "Dance F214", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif215"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_female^5", "Dance F215", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif216"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_female^6", "Dance F216", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif217"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_female^1", "Dance F217", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif218"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_female^2", "Dance F218", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif219"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_female^3", "Dance F219", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif220"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_female^4", "Dance F220", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif221"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_female^5", "Dance F221", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif222"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_female^6", "Dance F222", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif223"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_female^1", "Dance F223", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif224"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_female^2", "Dance F224", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif225"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_female^3", "Dance F225", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif226"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_female^4", "Dance F226", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif227"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_female^5", "Dance F227", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif228"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_female^6", "Dance F228", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif229"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^1", "Dance F229", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif230"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^2", "Dance F230", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif231"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^3", "Dance F231", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif232"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^4", "Dance F232", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif233"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^5", "Dance F233", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif234"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_female^6", "Dance F234", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif235"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^1", "Dance F235", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif236"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^2", "Dance F236", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif237"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^3", "Dance F237", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif238"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^4", "Dance F238", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif239"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^5", "Dance F239", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif240"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_female^6", "Dance F240", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif241"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^1", "Dance F241", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif242"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^2", "Dance F242", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif243"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^3", "Dance F243", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif244"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^4", "Dance F244", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif245"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^5", "Dance F245", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif246"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_female^6", "Dance F246", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif247"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_female^1", "Dance F247", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif248"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_female^2", "Dance F248", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif249"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_female^3", "Dance F249", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif250"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_female^4", "Dance F250", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif251"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_female^5", "Dance F251", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif252"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_female^6", "Dance F252", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif253"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^1", "Dance F253", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif254"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^2", "Dance F254", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif255"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^3", "Dance F255", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif256"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^4", "Dance F256", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif257"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^5", "Dance F257", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif258"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_female^6", "Dance F258", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif259"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^1", "Dance F259", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif260"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^2", "Dance F260", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif261"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^3", "Dance F261", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif262"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^4", "Dance F262", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif263"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^5", "Dance F263", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif264"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_female^6", "Dance F264", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif265"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^1", "Dance F265", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif266"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^2", "Dance F266", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif267"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^3", "Dance F267", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif268"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^4", "Dance F268", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif269"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^5", "Dance F269", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif270"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_female^6", "Dance F270", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif271"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^1", "Dance F271", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif272"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^2", "Dance F272", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif273"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^3", "Dance F273", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif274"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^4", "Dance F274", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif275"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^5", "Dance F275", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif276"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_female^6", "Dance F276", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif277"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^1", "Dance F277", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif278"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^2", "Dance F278", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif279"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^3", "Dance F279", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif280"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^4", "Dance F280", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif281"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^5", "Dance F281", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif282"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_female^6", "Dance F282", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif283"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^1", "Dance F283", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif284"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^2", "Dance F284", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif285"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^3", "Dance F285", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif286"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^4", "Dance F286", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif287"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^5", "Dance F287", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif288"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_female^6", "Dance F288", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif289"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^1", "Dance F289", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif290"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^2", "Dance F290", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif291"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^3", "Dance F291", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif292"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^4", "Dance F292", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif293"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^5", "Dance F293", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif294"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_female^6", "Dance F294", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif295"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^1", "Dance F295", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif296"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^2", "Dance F296", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif297"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^3", "Dance F297", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif298"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^4", "Dance F298", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif299"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^5", "Dance F299", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif300"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_female^6", "Dance F300", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif301"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^1", "Dance F301", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif302"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^2", "Dance F302", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif303"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^3", "Dance F303", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif304"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^4", "Dance F304", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif305"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^5", "Dance F305", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif306"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_female^6", "Dance F306", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif307"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_female^1", "Dance F307", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif308"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_female^2", "Dance F308", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif309"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_female^3", "Dance F309", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif310"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_female^4", "Dance F310", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif311"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_female^5", "Dance F311", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif312"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_female^6", "Dance F312", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif313"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^1", "Dance F313", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif314"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^2", "Dance F314", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif315"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^3", "Dance F315", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif316"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^4", "Dance F316", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif317"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^5", "Dance F317", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif318"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_female^6", "Dance F318", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif319"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^1", "Dance F319", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif320"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^2", "Dance F320", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif321"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^3", "Dance F321", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif322"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^4", "Dance F322", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif323"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^5", "Dance F323", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif324"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_female^6", "Dance F324", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif325"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^1", "Dance F325", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif326"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^2", "Dance F326", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif327"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^3", "Dance F327", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif328"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^4", "Dance F328", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif329"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^5", "Dance F329", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif330"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_female^6", "Dance F330", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif331"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^1", "Dance F331", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif332"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^2", "Dance F332", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif333"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^3", "Dance F333", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif334"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^4", "Dance F334", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif335"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^5", "Dance F335", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif336"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_female^6", "Dance F336", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif337"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^1", "Dance F337", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif338"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^2", "Dance F338", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif339"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^3", "Dance F339", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif340"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^4", "Dance F340", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif341"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^5", "Dance F341", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif342"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_female^6", "Dance F342", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif343"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^1", "Dance F343", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif344"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^2", "Dance F344", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif345"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^3", "Dance F345", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif346"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^4", "Dance F346", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif347"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^5", "Dance F347", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif348"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_female^6", "Dance F348", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif349"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_09_v1_female^1", "Dance F349", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif350"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_09_v1_female^2", "Dance F350", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif351"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_09_v2_female^1", "Dance F351", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif352"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_09_v2_female^2", "Dance F352", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif353"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_11_v1_female^1", "Dance F353", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif354"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_11_v1_female^2", "Dance F354", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif355"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_11_v2_female^1", "Dance F355", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif356"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_11_v2_female^2", "Dance F356", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif357"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_13_v1_female^1", "Dance F357", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif358"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_13_v1_female^2", "Dance F358", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif359"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_13_v2_female^1", "Dance F359", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif360"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_13_v2_female^2", "Dance F360", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif361"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_15_v1_female^1", "Dance F361", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif362"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_15_v1_female^2", "Dance F362", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif363"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_15_v2_female^1", "Dance F363", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif364"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_15_v2_female^2", "Dance F364", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif365"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_17_v1_female^1", "Dance F365", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif366"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupb@", "li_dance_crowd_17_v1_female^2", "Dance F366", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif367"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_a_f01", "Dance F367", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif368"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_a_f02", "Dance F368", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif369"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_a_f03", "Dance F369", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif370"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_a_f04", "Dance F370", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif371"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_b_f01", "Dance F371", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif372"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_b_f02", "Dance F372", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif373"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_b_f03", "Dance F373", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif374"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_b_f04", "Dance F374", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif375"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_c_f01", "Dance F375", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif376"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_c_f02", "Dance F376", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif377"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_c_f03", "Dance F377", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif378"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_c_f04", "Dance F378", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif379"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_d_f02", "Dance F379", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif380"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_d_f03", "Dance F380", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif381"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_e_f02", "Dance F381", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif382"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_f_f02", "Dance F382", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif383"] = {"anim@amb@nightclub_island@dancers@club@", "li_loop_f01", "Dance F383", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif384"] = {"anim@amb@nightclub_island@dancers@club@", "li_loop_f02", "Dance F384", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif385"] = {"anim@amb@nightclub_island@dancers@club@", "li_loop_f03", "Dance F385", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif386"] = {"anim@amb@nightclub_island@dancers@club@", "li_loop_f04", "Dance F386", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif387"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_a_f01", "Dance F387", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif388"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_a_f02", "Dance F388", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif389"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_b_f01", "Dance F389", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif390"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_b_f02", "Dance F390", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif391"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_c_f01", "Dance F391", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif392"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_c_f02", "Dance F392", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif393"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_loop_f01", "Dance F393", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif394"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_loop_f02", "Dance F394", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif403"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_09_v1_female^1", "Dance F403", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif404"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_11_v1_female^1", "Dance F404", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif405"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_17_v1_female^1", "Dance F405", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif406"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_15_v1_female^1", "Dance F406", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif407"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_11_v2_female^1", "Dance F407", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif408"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_15_v2_female^1", "Dance F408", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif409"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_17_v2_female^1", "Dance F409", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif410"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_13_v2_female^1", "Dance F410", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif411"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_13_v1_female^1", "Dance F411", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif412"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_09_v1_female^1", "Dance F412", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif413"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_17_v1_female^1", "Dance F413", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif414"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_15_v2_female^1", "Dance F414", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif415"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_15_v1_female^1", "Dance F415", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif416"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_13_v2_female^1", "Dance F416", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif417"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_13_v1_female^1", "Dance F417", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif418"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_11_v2_female^1", "Dance F418", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif419"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_11_v1_female^1", "Dance F419", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif420"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_09_v2_female^1", "Dance F420", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif421"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_13_v1_female^1", "Dance F421", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif422"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_09_v1_female^1", "Dance F422", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif423"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_09_v1_female^2", "Dance F423", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif424"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_09_v2_female^1", "Dance F424", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif425"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_09_v2_female^2", "Dance F425", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif426"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_11_v2_female^1", "Dance F426", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif427"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_11_v1_female^1", "Dance F427", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif428"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_11_v1_female^2", "Dance F428", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif429"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_11_v2_female^2", "Dance F429", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif430"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_13_v1_female^2", "Dance F430", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif431"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_17_v1_female^1", "Dance F431", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif432"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_17_v1_female^2", "Dance F432", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif433"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_15_v2_female^1", "Dance F433", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif434"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_15_v2_female^2", "Dance F434", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif435"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_15_v1_female^1", "Dance F435", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif436"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_15_v1_female^2", "Dance F436", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif437"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_13_v2_female^1", "Dance F437", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dlif438"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_13_v2_female^2", "Dance F438", AnimationOptions =
        {
            EmoteLoop = true,
        }},

}

DP.LiDan = {
    ["dli001"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^1", "Dance 001", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli002"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^2", "Dance 002", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli003"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^3", "Dance 003", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli004"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^4", "Dance 004", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli005"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^5", "Dance 005", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli006"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^6", "Dance 006", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli007"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^1", "Dance 007", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli008"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^2", "Dance 008", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli009"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^3", "Dance 009", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli010"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^4", "Dance 010", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli011"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^5", "Dance 011", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli012"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^6", "Dance 012", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli013"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^1", "Dance 013", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli014"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^2", "Dance 014", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli015"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^3", "Dance 015", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli016"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^4", "Dance 016", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli017"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^5", "Dance 017", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli018"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^6", "Dance 018", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli019"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^1", "Dance 019", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli020"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^2", "Dance 020", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli021"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^3", "Dance 021", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli022"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^4", "Dance 022", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli023"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^5", "Dance 023", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli024"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^6", "Dance 024", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli025"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^1", "Dance 025", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli026"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^2", "Dance 026", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli027"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^3", "Dance 027", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli028"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^4", "Dance 028", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli029"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^5", "Dance 029", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli030"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^6", "Dance 030", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli031"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^1", "Dance 031", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli032"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^2", "Dance 032", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli033"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^3", "Dance 033", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli034"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^4", "Dance 034", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli035"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^5", "Dance 035", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli036"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^6", "Dance 036", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli037"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^1", "Dance 037", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli038"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^2", "Dance 038", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli039"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^3", "Dance 039", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli040"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^4", "Dance 040", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli041"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^5", "Dance 041", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli042"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^6", "Dance 042", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli043"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^1", "Dance 043", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli044"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^2", "Dance 044", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli045"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^3", "Dance 045", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli046"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^4", "Dance 046", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli047"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^5", "Dance 047", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli048"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^6", "Dance 048", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli049"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^1", "Dance 049", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli050"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^2", "Dance 050", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli051"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^3", "Dance 051", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli052"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^4", "Dance 052", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli053"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^5", "Dance 053", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli054"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^6", "Dance 054", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["dli073"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_a_m01", "Dance 073", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli074"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_a_m02", "Dance 074", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli075"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_a_m03", "Dance 075", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli076"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_a_m04", "Dance 076", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli077"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_a_m05", "Dance 077", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli078"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_b_m01", "Dance 078", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli079"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_b_m02", "Dance 079", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli080"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_b_m03", "Dance 080", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli081"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_b_m04", "Dance 081", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli082"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_b_m05", "Dance 082", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli083"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_c_m01", "Dance 083", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli084"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_c_m02", "Dance 084", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli085"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_c_m03", "Dance 085", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli086"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_c_m04", "Dance 086", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli087"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_c_m05", "Dance 087", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli088"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_idle_d_m02", "Dance 088", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli089"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_loop_m01", "Dance 089", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli090"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_loop_m02", "Dance 090", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli091"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_loop_m03", "Dance 091", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli092"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_loop_m04", "Dance 092", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli093"] = {"anim@amb@nightclub_island@dancers@beachdance@", "li_loop_m05", "Dance 093", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli094"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^1", "Dance 094", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli095"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^2", "Dance 095", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli096"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^3", "Dance 096", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli097"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^4", "Dance 097", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli098"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^5", "Dance 098", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli099"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^6", "Dance 099", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli100"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^1", "Dance 100", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli101"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^2", "Dance 101", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli102"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^3", "Dance 102", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli103"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^4", "Dance 103", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli104"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^5", "Dance 104", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli105"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^6", "Dance 105", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli106"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^1", "Dance 106", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli107"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^2", "Dance 107", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli108"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^3", "Dance 108", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli109"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^4", "Dance 109", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli110"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^5", "Dance 110", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli111"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^6", "Dance 111", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli112"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^1", "Dance 112", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli113"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^2", "Dance 113", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli114"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^3", "Dance 114", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli115"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^4", "Dance 115", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli116"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^5", "Dance 116", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli117"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^6", "Dance 117", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli118"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^1", "Dance 118", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli119"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^2", "Dance 119", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli120"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^3", "Dance 120", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli121"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^4", "Dance 121", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli122"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^5", "Dance 122", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli123"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^6", "Dance 123", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli124"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^1", "Dance 124", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli125"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^2", "Dance 125", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli126"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^3", "Dance 126", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli127"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^4", "Dance 127", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli128"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^5", "Dance 128", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli129"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^6", "Dance 129", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli130"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^1", "Dance 130", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli131"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^2", "Dance 131", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli132"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^3", "Dance 132", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli133"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^4", "Dance 133", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli134"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^5", "Dance 134", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli135"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^6", "Dance 135", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli136"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^1", "Dance 136", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli137"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^2", "Dance 137", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli138"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^3", "Dance 138", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli139"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^4", "Dance 139", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli140"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^5", "Dance 140", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli141"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^6", "Dance 141", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli142"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^1", "Dance 142", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli143"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^2", "Dance 143", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli144"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^3", "Dance 144", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli145"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^4", "Dance 145", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli146"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^5", "Dance 146", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli147"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^6", "Dance 147", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli148"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_male^1", "Dance 148", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli149"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_male^2", "Dance 149", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli150"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_male^3", "Dance 150", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli151"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_male^4", "Dance 151", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli152"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_male^5", "Dance 152", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli153"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v1_male^6", "Dance 153", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli154"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_male^1", "Dance 154", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli155"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_male^2", "Dance 155", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli156"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_male^3", "Dance 156", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli157"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_male^4", "Dance 157", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli158"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_male^5", "Dance 158", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli159"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_09_v2_male^6", "Dance 159", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli160"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_male^1", "Dance 160", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli161"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_male^2", "Dance 161", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli162"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_male^3", "Dance 162", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli163"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_male^4", "Dance 163", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli164"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_male^5", "Dance 164", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli165"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v1_male^6", "Dance 165", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli166"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_male^1", "Dance 166", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli167"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_male^2", "Dance 167", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli168"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_male^3", "Dance 168", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli169"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_male^4", "Dance 169", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli170"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_male^5", "Dance 170", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli171"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_11_v2_male^6", "Dance 171", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli172"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_male^1", "Dance 172", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli173"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_male^2", "Dance 173", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli174"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_male^3", "Dance 174", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli175"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_male^4", "Dance 175", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli176"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_male^5", "Dance 176", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli177"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v1_male^6", "Dance 177", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli178"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_male^1", "Dance 178", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli179"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_male^2", "Dance 179", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli180"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_male^3", "Dance 180", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli181"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_male^4", "Dance 181", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli182"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_male^5", "Dance 182", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli183"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_13_v2_male^6", "Dance 183", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli184"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_male^1", "Dance 184", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli185"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_male^2", "Dance 185", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli186"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_male^3", "Dance 186", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli187"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_male^4", "Dance 187", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli188"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_male^5", "Dance 188", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli189"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v1_male^6", "Dance 189", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli190"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_male^1", "Dance 190", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli191"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_male^2", "Dance 191", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli192"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_male^3", "Dance 192", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli193"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_male^4", "Dance 193", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli194"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_male^5", "Dance 194", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli195"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_15_v2_male^6", "Dance 195", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli196"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_male^1", "Dance 196", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli197"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_male^2", "Dance 197", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli198"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_male^3", "Dance 198", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli199"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_male^4", "Dance 199", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli200"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_male^5", "Dance 200", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli201"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v1_male^6", "Dance 201", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli202"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_male^1", "Dance 202", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli203"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_male^2", "Dance 203", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli204"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_male^3", "Dance 204", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli205"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_male^4", "Dance 205", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli206"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_male^5", "Dance 206", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli207"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "li_dance_crowd_17_v2_male^6", "Dance 207", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli208"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_male^1", "Dance 208", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli209"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_male^2", "Dance 209", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli210"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_male^3", "Dance 210", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli211"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_male^4", "Dance 211", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli212"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_male^5", "Dance 212", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli213"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v1_male^6", "Dance 213", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli214"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_male^1", "Dance 214", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli215"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_male^2", "Dance 215", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli216"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_male^3", "Dance 216", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli217"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_male^4", "Dance 217", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli218"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_male^5", "Dance 218", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli219"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_09_v2_male^6", "Dance 219", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli220"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_male^1", "Dance 220", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli221"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_male^2", "Dance 221", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli222"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_male^3", "Dance 222", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli223"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_male^4", "Dance 223", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli224"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_male^5", "Dance 224", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli225"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v1_male^6", "Dance 225", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli226"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_male^1", "Dance 226", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli227"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_male^2", "Dance 227", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli228"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_male^3", "Dance 228", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli229"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_male^4", "Dance 229", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli230"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_male^5", "Dance 230", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli231"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_11_v2_male^6", "Dance 231", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli232"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_male^1", "Dance 232", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli233"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_male^2", "Dance 233", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli234"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_male^3", "Dance 234", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli235"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_male^4", "Dance 235", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli236"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_male^5", "Dance 236", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli237"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v1_male^6", "Dance 237", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli238"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_male^1", "Dance 238", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli239"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_male^2", "Dance 239", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli240"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_male^3", "Dance 240", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli241"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_male^4", "Dance 241", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli242"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_male^5", "Dance 242", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli243"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_13_v2_male^6", "Dance 243", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli244"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_male^1", "Dance 244", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli245"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_male^2", "Dance 245", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli246"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_male^3", "Dance 246", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli247"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_male^4", "Dance 247", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli248"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_male^5", "Dance 248", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli249"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v1_male^6", "Dance 249", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli250"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_male^1", "Dance 250", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli251"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_male^2", "Dance 251", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli252"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_male^3", "Dance 252", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli253"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_male^4", "Dance 253", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli254"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_male^5", "Dance 254", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli255"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_15_v2_male^6", "Dance 255", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli256"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_male^1", "Dance 256", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli257"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_male^2", "Dance 257", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli258"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_male^3", "Dance 258", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli259"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_male^4", "Dance 259", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli260"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_male^5", "Dance 260", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli261"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_male^6", "Dance 261", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli262"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_male^1", "Dance 262", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli263"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_male^2", "Dance 263", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli264"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_male^3", "Dance 264", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli265"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_male^4", "Dance 265", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli266"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_male^5", "Dance 266", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli267"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v2_male^6", "Dance 267", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli268"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_a_m01", "Dance 268", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli269"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_a_m02", "Dance 269", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli270"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_a_m03", "Dance 270", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli271"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_b_m01", "Dance 271", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli272"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_b_m02", "Dance 272", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli273"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_b_m03", "Dance 273", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli274"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_c_m01", "Dance 274", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli275"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_c_m02", "Dance 275", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli276"] = {"anim@amb@nightclub_island@dancers@club@", "li_idle_c_m03", "Dance 276", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli277"] = {"anim@amb@nightclub_island@dancers@club@", "li_loop_m01", "Dance 277", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli278"] = {"anim@amb@nightclub_island@dancers@club@", "li_loop_m02", "Dance 278", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli279"] = {"anim@amb@nightclub_island@dancers@club@", "li_loop_m03", "Dance 279", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli280"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^1", "Dance 280", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli281"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^2", "Dance 281", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli282"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^3", "Dance 282", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli283"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^4", "Dance 283", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli284"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^5", "Dance 284", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli285"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v1_male^6", "Dance 285", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli286"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^1", "Dance 286", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli287"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^2", "Dance 287", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli288"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^3", "Dance 288", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli289"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^4", "Dance 289", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli290"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^5", "Dance 290", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli291"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_09_v2_male^6", "Dance 291", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli292"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^1", "Dance 292", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli293"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^2", "Dance 293", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli294"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^3", "Dance 294", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli295"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^4", "Dance 295", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli296"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^5", "Dance 296", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli297"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v1_male^6", "Dance 297", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli298"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_male^1", "Dance 298", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli299"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_male^2", "Dance 299", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli300"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_male^3", "Dance 300", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli301"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_male^4", "Dance 301", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli302"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_male^5", "Dance 302", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli303"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_11_v2_male^6", "Dance 303", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli304"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^1", "Dance 304", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli305"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^2", "Dance 305", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli306"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^3", "Dance 306", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli307"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^4", "Dance 307", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli308"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^5", "Dance 308", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli309"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v1_male^6", "Dance 309", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli310"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^1", "Dance 310", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli311"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^2", "Dance 311", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli312"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^3", "Dance 312", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli313"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^4", "Dance 313", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli314"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^5", "Dance 314", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli315"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_13_v2_male^6", "Dance 315", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli316"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^1", "Dance 316", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli317"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^2", "Dance 317", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli318"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^3", "Dance 318", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli319"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^4", "Dance 319", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli320"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^5", "Dance 320", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli321"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v1_male^6", "Dance 321", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli322"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^1", "Dance 322", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli323"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^2", "Dance 323", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli324"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^3", "Dance 324", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli325"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^4", "Dance 325", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli326"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^5", "Dance 326", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli327"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_15_v2_male^6", "Dance 327", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli328"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^1", "Dance 328", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli329"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^2", "Dance 329", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli330"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^3", "Dance 330", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli331"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^4", "Dance 331", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli332"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^5", "Dance 332", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli333"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v1_male^6", "Dance 333", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli334"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^1", "Dance 334", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli335"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^2", "Dance 335", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli336"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^3", "Dance 336", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli337"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^4", "Dance 337", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli338"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^5", "Dance 338", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli339"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "li_dance_facedj_17_v2_male^6", "Dance 339", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli340"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^1", "Dance 340", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli341"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^2", "Dance 341", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli342"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^3", "Dance 342", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli343"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^4", "Dance 343", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli344"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^5", "Dance 344", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli345"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^6", "Dance 345", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli346"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^1", "Dance 346", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli347"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^2", "Dance 347", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli348"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^3", "Dance 348", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli349"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^4", "Dance 349", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli350"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^5", "Dance 350", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli351"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v2_male^6", "Dance 351", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli352"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^1", "Dance 352", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli353"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^2", "Dance 353", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli354"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^3", "Dance 354", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli355"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^4", "Dance 355", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli356"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^5", "Dance 356", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli357"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v1_male^6", "Dance 357", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli358"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_male^1", "Dance 358", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli359"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_male^2", "Dance 359", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli360"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_male^3", "Dance 360", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli361"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_male^4", "Dance 361", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli362"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_male^5", "Dance 362", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli363"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_11_v2_male^6", "Dance 363", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli364"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^1", "Dance 364", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli365"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^2", "Dance 365", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli366"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^3", "Dance 366", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli367"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^4", "Dance 367", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli368"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^5", "Dance 368", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli369"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v1_male^6", "Dance 369", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli370"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^1", "Dance 370", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli371"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^2", "Dance 371", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli372"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^3", "Dance 372", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli373"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^4", "Dance 373", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli374"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^5", "Dance 374", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli375"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_13_v2_male^6", "Dance 375", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli376"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^1", "Dance 376", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli377"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^2", "Dance 377", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli378"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^3", "Dance 378", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli379"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^4", "Dance 379", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli380"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^5", "Dance 380", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli381"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v1_male^6", "Dance 381", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli382"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^1", "Dance 382", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli383"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^2", "Dance 383", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli384"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^3", "Dance 384", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli385"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^4", "Dance 385", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli386"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^5", "Dance 386", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli387"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_15_v2_male^6", "Dance 387", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli388"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^1", "Dance 388", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli389"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^2", "Dance 389", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli390"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^3", "Dance 390", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli391"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^4", "Dance 391", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli392"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^5", "Dance 392", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli393"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v1_male^6", "Dance 393", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli394"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^1", "Dance 394", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli395"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^2", "Dance 395", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli396"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^3", "Dance 396", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli397"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^4", "Dance 397", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli398"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^5", "Dance 398", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli399"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_17_v2_male^6", "Dance 399", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli400"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_09_v1_male^1", "Dance 400", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli401"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_09_v1_male^2", "Dance 401", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli402"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_09_v2_male^1", "Dance 402", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli403"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_09_v2_male^2", "Dance 403", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli404"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_11_v1_male^1", "Dance 404", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli405"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_11_v1_male^2", "Dance 405", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli406"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_11_v2_male^1", "Dance 406", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli407"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_11_v2_male^2", "Dance 407", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli408"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_13_v1_male^1", "Dance 408", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli409"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_13_v1_male^2", "Dance 409", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli410"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_13_v2_male^1", "Dance 410", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli411"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_13_v2_male^2", "Dance 411", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli412"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_15_v1_male^1", "Dance 412", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli413"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_15_v1_male^2", "Dance 413", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli414"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_15_v2_male^1", "Dance 414", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli415"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_15_v2_male^2", "Dance 415", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli416"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_17_v1_male^1", "Dance 416", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli417"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "li_dance_crowd_17_v1_male^2", "Dance 417", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli418"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_09_v1_male^1", "Dance 418", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli419"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_09_v2_male^1", "Dance 419", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli420"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_11_v1_male^1", "Dance 420", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli421"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_11_v2_male^1", "Dance 421", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli422"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_13_v1_male^1", "Dance 422", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli423"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_13_v2_male^1", "Dance 423", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli424"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_15_v1_male^1", "Dance 424", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli425"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_15_v2_male^1", "Dance 425", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli426"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_17_v1_male^1", "Dance 426", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli427"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_06_base_laz", "Dance 427", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli428"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_06_base_v2_laz", "Dance 428", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli429"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_07_fakedrop_laz", "Dance 429", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli430"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_11_bigbase_laz", "Dance 430", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli431"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_11_pointcrowd_laz", "Dance 431", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli432"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_11_takebreath_laz", "Dance 432", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli433"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_13_hipswivel_laz", "Dance 433", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli434"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_13_turnaround_laz", "Dance 434", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli435"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_15_flyingv_laz", "Dance 435", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli436"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_15_sexygrind_laz", "Dance 436", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli437"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_17_ethereal_laz", "Dance 437", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli438"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_17_watupcrowd_laz", "Dance 438", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli439"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_09_v1_male^1", "Dance 439", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli440"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_09_v2_male^1", "Dance 440", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli441"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_11_v1_male^1", "Dance 441", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli442"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_11_v2_male^1", "Dance 442", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli443"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_13_v1_male^1", "Dance 443", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli444"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_13_v2_male^1", "Dance 444", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli445"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_15_v1_male^1", "Dance 445", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli446"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_15_v2_male^1", "Dance 446", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli447"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_17_v1_male^1", "Dance 447", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli448"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "li_dance_crowd_17_v2_male^1", "Dance 448", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli449"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_09_v1_male^1", "Dance 449", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli450"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_09_v2_male^1", "Dance 450", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli451"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_11_v1_male^1", "Dance 451", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli452"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_11_v2_male^1", "Dance 452", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli453"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_13_v1_male^1", "Dance 453", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli454"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_13_v2_male^1", "Dance 454", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli455"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_15_v1_male^1", "Dance 455", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli456"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_15_v2_male^1", "Dance 456", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli457"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "li_dance_crowd_17_v1_male^1", "Dance 457", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli458"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_17_v1_male_^2", "Dance 458", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli459"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_15_v2_male_^2", "Dance 459", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli460"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_15_v1_male_^2", "Dance 460", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli461"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_13_v2_male_^2", "Dance 461", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli462"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_13_v1_male_^2", "Dance 462", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli463"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_11_v2_male_^2", "Dance 463", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli464"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_09_v2_male_^2", "Dance 464", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli465"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_11_v1_male_^2", "Dance 465", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dli466"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "li_dance_crowd_09_v1_male_^2", "Dance 466", AnimationOptions =
        {
            EmoteLoop = true,
        }},


}


DP.MiDan = {
    ["dmi001"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^1", "Dance 001", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi002"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^2", "Dance 002", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi003"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^3", "Dance 003", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi004"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^4", "Dance 004", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi005"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^5", "Dance 005", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi006"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^6", "Dance 006", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi007"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^1", "Dance 007", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi008"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^2", "Dance 008", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi009"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^3", "Dance 009", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi010"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^4", "Dance 010", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi011"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^5", "Dance 011", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi012"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^6", "Dance 012", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi013"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^1", "Dance 013", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi014"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^2", "Dance 014", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi015"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^3", "Dance 015", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi016"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^4", "Dance 016", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi017"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^5", "Dance 017", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi018"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^6", "Dance 018", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi019"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_male^1", "Dance 019", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi020"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_male^2", "Dance 020", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi021"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_male^3", "Dance 021", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi022"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_male^4", "Dance 022", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi023"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_male^5", "Dance 023", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi024"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v2_male^6", "Dance 024", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi025"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^1", "Dance 025", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi026"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^2", "Dance 026", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi027"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^3", "Dance 027", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi028"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^4", "Dance 028", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi029"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^5", "Dance 029", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi030"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^6", "Dance 030", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi031"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^1", "Dance 031", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi032"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^2", "Dance 032", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi033"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^3", "Dance 033", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi034"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^4", "Dance 034", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi035"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^5", "Dance 035", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi036"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^6", "Dance 036", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi037"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^1", "Dance 037", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi038"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^2", "Dance 038", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi039"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^3", "Dance 039", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi040"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^4", "Dance 040", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi041"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^5", "Dance 041", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi042"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^6", "Dance 042", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi043"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^1", "Dance 043", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi044"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^2", "Dance 044", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi045"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^3", "Dance 045", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi046"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^4", "Dance 046", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi047"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^5", "Dance 047", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi048"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^6", "Dance 048", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi049"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^1", "Dance 049", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi050"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^2", "Dance 050", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi051"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^3", "Dance 051", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi052"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^4", "Dance 052", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi053"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^5", "Dance 053", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi054"] = {"anim@amb@nightclub@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^6", "Dance 054", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["dmi074"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_a_m01", "Dance 074", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi075"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_a_m02", "Dance 075", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi076"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_a_m03", "Dance 076", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi077"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_a_m04", "Dance 077", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi078"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_a_m05", "Dance 078", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi079"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_b_m01", "Dance 079", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi080"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_b_m02", "Dance 080", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi081"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_b_m03", "Dance 081", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi082"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_b_m04", "Dance 082", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi083"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_b_m05", "Dance 083", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi084"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_c_m01", "Dance 084", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi085"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_c_m02", "Dance 085", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi086"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_c_m03", "Dance 086", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi087"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_c_m04", "Dance 087", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi088"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_c_m05", "Dance 088", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi089"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_idle_d_m05", "Dance 089", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi090"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_loop_m01", "Dance 090", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi091"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_loop_m02", "Dance 091", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi092"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_loop_m03", "Dance 092", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi093"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_loop_m04", "Dance 093", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi094"] = {"anim@amb@nightclub_island@dancers@beachdance@", "mi_loop_m05", "Dance 094", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi095"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^1", "Dance 095", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi096"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^2", "Dance 096", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi097"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^3", "Dance 097", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi098"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^4", "Dance 098", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi099"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^5", "Dance 099", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi100"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^6", "Dance 100", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi101"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^1", "Dance 101", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi102"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^2", "Dance 102", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi103"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^3", "Dance 103", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi104"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^4", "Dance 104", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi105"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^5", "Dance 105", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi106"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^6", "Dance 106", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi107"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^1", "Dance 107", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi108"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^2", "Dance 108", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi109"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^3", "Dance 109", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi110"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^4", "Dance 110", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi111"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^5", "Dance 111", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi112"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^6", "Dance 112", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi113"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_male^1", "Dance 113", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi114"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_male^2", "Dance 114", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi115"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_male^3", "Dance 115", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi116"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_male^4", "Dance 116", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi117"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_male^5", "Dance 117", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi118"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_11_v2_male^6", "Dance 118", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi119"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^1", "Dance 119", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi120"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^2", "Dance 120", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi121"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^3", "Dance 121", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi122"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^4", "Dance 122", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi123"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^5", "Dance 123", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi124"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^6", "Dance 124", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi125"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^1", "Dance 125", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi126"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^2", "Dance 126", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi127"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^3", "Dance 127", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi128"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^4", "Dance 128", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi129"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^5", "Dance 129", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi130"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^6", "Dance 130", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi131"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^1", "Dance 131", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi132"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^2", "Dance 132", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi133"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^3", "Dance 133", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi134"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^4", "Dance 134", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi135"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^5", "Dance 135", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi136"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^6", "Dance 136", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi137"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^1", "Dance 137", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi138"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^2", "Dance 138", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi139"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^3", "Dance 139", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi140"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^4", "Dance 140", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi141"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^5", "Dance 141", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi142"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^6", "Dance 142", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi143"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^1", "Dance 143", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi144"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^2", "Dance 144", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi145"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^3", "Dance 145", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi146"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^4", "Dance 146", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi147"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^5", "Dance 147", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi148"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^6", "Dance 148", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi149"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_male^1", "Dance 149", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi150"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_male^2", "Dance 150", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi151"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_male^3", "Dance 151", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi152"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_male^4", "Dance 152", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi153"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_male^5", "Dance 153", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi154"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_09_v2_male^6", "Dance 154", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi155"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_male^1", "Dance 155", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi156"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_male^2", "Dance 156", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi157"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_male^3", "Dance 157", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi158"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_male^4", "Dance 158", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi159"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_male^5", "Dance 159", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi160"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_10_v2_male^6", "Dance 160", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi161"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_male^1", "Dance 161", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi162"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_male^2", "Dance 162", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi163"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_male^3", "Dance 163", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi164"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_male^4", "Dance 164", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi165"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_male^5", "Dance 165", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi166"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v1_male^6", "Dance 166", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi167"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_male^1", "Dance 167", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi168"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_male^2", "Dance 168", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi169"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_male^3", "Dance 169", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi170"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_male^4", "Dance 170", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi171"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_male^5", "Dance 171", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi172"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_11_v2_male^6", "Dance 172", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi173"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_male^1", "Dance 173", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi174"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_male^2", "Dance 174", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi175"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_male^3", "Dance 175", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi176"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_male^4", "Dance 176", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi177"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_male^5", "Dance 177", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi178"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v1_male^6", "Dance 178", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi179"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_male^1", "Dance 179", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi180"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_male^2", "Dance 180", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi181"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_male^3", "Dance 181", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi182"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_male^4", "Dance 182", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi183"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_male^5", "Dance 183", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi184"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_13_v2_male^6", "Dance 184", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi185"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_male^1", "Dance 185", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi186"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_male^2", "Dance 186", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi187"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_male^3", "Dance 187", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi188"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_male^4", "Dance 188", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi189"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_male^5", "Dance 189", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi190"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v1_male^6", "Dance 190", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi191"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_male^1", "Dance 191", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi192"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_male^2", "Dance 192", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi193"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_male^3", "Dance 193", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi194"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_male^4", "Dance 194", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi195"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_male^5", "Dance 195", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi196"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_15_v2_male^6", "Dance 196", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi197"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_male^1", "Dance 197", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi198"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_male^2", "Dance 198", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi199"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_male^3", "Dance 199", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi200"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_male^4", "Dance 200", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi201"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_male^5", "Dance 201", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi202"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v1_male^6", "Dance 202", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi203"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_male^1", "Dance 203", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi204"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_male^2", "Dance 204", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi205"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_male^3", "Dance 205", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi206"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_male^4", "Dance 206", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi207"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_male^5", "Dance 207", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi208"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "mi_dance_crowd_17_v2_male^6", "Dance 208", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi209"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^1", "Dance 209", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi210"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^2", "Dance 210", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi211"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^3", "Dance 211", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi212"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^4", "Dance 212", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi213"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^5", "Dance 213", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi214"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^6", "Dance 214", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi215"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^1", "Dance 215", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi216"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^2", "Dance 216", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi217"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^3", "Dance 217", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi218"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^4", "Dance 218", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi219"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^5", "Dance 219", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi220"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^6", "Dance 220", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi221"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^1", "Dance 221", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi222"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^2", "Dance 222", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi223"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^3", "Dance 223", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi224"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^4", "Dance 224", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi225"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^5", "Dance 225", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi226"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^6", "Dance 226", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi227"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^1", "Dance 227", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi228"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^2", "Dance 228", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi229"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^3", "Dance 229", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi230"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^4", "Dance 230", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi231"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^5", "Dance 231", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi232"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^6", "Dance 232", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi233"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^1", "Dance 233", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi234"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^2", "Dance 234", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi235"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^3", "Dance 235", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi236"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^4", "Dance 236", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi237"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^5", "Dance 237", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi238"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^6", "Dance 238", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi239"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^1", "Dance 239", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi240"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^2", "Dance 240", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi241"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^3", "Dance 241", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi242"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^4", "Dance 242", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi243"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^5", "Dance 243", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi244"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^6", "Dance 244", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi245"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^1", "Dance 245", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi246"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^2", "Dance 246", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi247"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^3", "Dance 247", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi248"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^4", "Dance 248", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi249"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^5", "Dance 249", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi250"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^6", "Dance 250", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi251"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^1", "Dance 251", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi252"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^2", "Dance 252", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi253"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^3", "Dance 253", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi254"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^4", "Dance 254", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi255"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^5", "Dance 255", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi256"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^6", "Dance 256", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi257"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^1", "Dance 257", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi258"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^2", "Dance 258", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi259"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^3", "Dance 259", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi260"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^4", "Dance 260", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi261"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^5", "Dance 261", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi262"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^6", "Dance 262", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi263"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^1", "Dance 263", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi264"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^2", "Dance 264", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi265"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^3", "Dance 265", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi266"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^4", "Dance 266", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi267"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^5", "Dance 267", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi268"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^6", "Dance 268", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi269"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^1", "Dance 269", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi270"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^2", "Dance 270", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi271"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^3", "Dance 271", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi272"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^4", "Dance 272", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi273"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^5", "Dance 273", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi274"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_09_v2_male^6", "Dance 274", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi275"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^1", "Dance 275", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi276"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^2", "Dance 276", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi277"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^3", "Dance 277", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi278"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^4", "Dance 278", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi279"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^5", "Dance 279", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi280"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_10_v2_male^6", "Dance 280", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi281"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^1", "Dance 281", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi282"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^2", "Dance 282", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi283"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^3", "Dance 283", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi284"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^4", "Dance 284", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi285"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^5", "Dance 285", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi286"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v1_male^6", "Dance 286", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi287"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^1", "Dance 287", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi288"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^2", "Dance 288", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi289"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^3", "Dance 289", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi290"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^4", "Dance 290", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi291"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^5", "Dance 291", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi292"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_11_v2_male^6", "Dance 292", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi293"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^1", "Dance 293", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi294"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^2", "Dance 294", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi295"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^3", "Dance 295", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi296"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^4", "Dance 296", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi297"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^5", "Dance 297", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi298"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v1_male^6", "Dance 298", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi299"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^1", "Dance 299", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi300"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^2", "Dance 300", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi301"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^3", "Dance 301", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi302"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^4", "Dance 302", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi303"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^5", "Dance 303", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi304"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_13_v2_male^6", "Dance 304", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi305"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^1", "Dance 305", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi306"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^2", "Dance 306", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi307"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^3", "Dance 307", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi308"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^4", "Dance 308", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi309"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^5", "Dance 309", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi310"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v1_male^6", "Dance 310", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi311"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^1", "Dance 311", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi312"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^2", "Dance 312", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi313"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^3", "Dance 313", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi314"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^4", "Dance 314", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi315"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^5", "Dance 315", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi316"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_15_v2_male^6", "Dance 316", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi317"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^1", "Dance 317", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi318"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^2", "Dance 318", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi319"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^3", "Dance 319", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi320"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^4", "Dance 320", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi321"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^5", "Dance 321", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi322"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v1_male^6", "Dance 322", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi323"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^1", "Dance 323", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi324"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^2", "Dance 324", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi325"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^3", "Dance 325", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi326"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^4", "Dance 326", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi327"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^5", "Dance 327", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi328"] = {"anim@amb@nightclub@dancers@crowddance_groups@med_intensity", "mi_dance_crowd_17_v2_male^6", "Dance 328", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi329"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_a_f01", "Dance 329", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi330"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_a_f02", "Dance 330", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi331"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_a_f03", "Dance 331", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi332"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_a_f04", "Dance 332", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi333"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_a_m01", "Dance 333", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi334"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_a_m02", "Dance 334", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi335"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_a_m03", "Dance 335", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi336"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_b_f01", "Dance 336", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi337"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_b_f02", "Dance 337", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi338"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_b_f03", "Dance 338", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi339"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_b_f04", "Dance 339", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi340"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_b_m01", "Dance 340", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi341"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_b_m02", "Dance 341", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi342"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_b_m03", "Dance 342", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi343"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_c_f01", "Dance 343", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi344"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_c_f02", "Dance 344", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi345"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_c_f03", "Dance 345", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi346"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_c_f04", "Dance 346", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi347"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_c_m01", "Dance 347", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi348"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_c_m02", "Dance 348", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi349"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_c_m03", "Dance 349", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi350"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_d_f02", "Dance 350", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi351"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_d_f04", "Dance 351", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi352"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_e_f02", "Dance 352", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi353"] = {"anim@amb@nightclub_island@dancers@club@", "mi_idle_f_f02", "Dance 353", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi354"] = {"anim@amb@nightclub_island@dancers@club@", "mi_loop_f01 8", "Dance 354", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi355"] = {"anim@amb@nightclub_island@dancers@club@", "mi_loop_f02", "Dance 355", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi356"] = {"anim@amb@nightclub_island@dancers@club@", "mi_loop_f03", "Dance 356", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi357"] = {"anim@amb@nightclub_island@dancers@club@", "mi_loop_f04", "Dance 357", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi358"] = {"anim@amb@nightclub_island@dancers@club@", "mi_loop_m01", "Dance 358", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi359"] = {"anim@amb@nightclub_island@dancers@club@", "mi_loop_m02", "Dance 359", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi360"] = {"anim@amb@nightclub_island@dancers@club@", "mi_loop_m03", "Dance 360", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi361"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^1", "Dance 361", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi362"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^2", "Dance 362", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi363"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^3", "Dance 363", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi364"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^4", "Dance 364", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi365"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^5", "Dance 365", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi366"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^6", "Dance 366", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi367"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^1", "Dance 367", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi368"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^2", "Dance 368", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi369"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^3", "Dance 369", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi370"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^4", "Dance 370", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi371"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^5", "Dance 371", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi372"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_male^6", "Dance 372", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi373"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^1", "Dance 373", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi374"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^2", "Dance 374", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi375"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^3", "Dance 375", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi376"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^4", "Dance 376", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi377"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^5", "Dance 377", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi378"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_11_v1_male^6", "Dance 378", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi379"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^1", "Dance 379", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi380"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^2", "Dance 380", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi381"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^3", "Dance 381", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi382"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^4", "Dance 382", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi383"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^5", "Dance 383", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi384"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v1_male^6", "Dance 384", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi385"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^1", "Dance 385", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi386"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^2", "Dance 386", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi387"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^3", "Dance 387", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi388"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^4", "Dance 388", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi389"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^5", "Dance 389", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi390"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_13_v2_male^6", "Dance 390", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi391"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^1", "Dance 391", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi392"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^2", "Dance 392", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi393"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^3", "Dance 393", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi394"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^4", "Dance 394", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi395"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^5", "Dance 395", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi396"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v1_male^6", "Dance 396", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi397"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^1", "Dance 397", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi398"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^2", "Dance 398", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi399"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^3", "Dance 399", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi400"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^4", "Dance 400", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi401"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^5", "Dance 401", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi402"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^6", "Dance 402", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi403"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^1", "Dance 403", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi404"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^2", "Dance 404", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi405"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^3", "Dance 405", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi406"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^4", "Dance 406", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi407"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^5", "Dance 407", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi408"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v1_male^6", "Dance 408", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi409"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^1", "Dance 409", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi410"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^2", "Dance 410", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi411"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^3", "Dance 411", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi412"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^4", "Dance 412", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi413"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^5", "Dance 413", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi414"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^6", "Dance 414", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi415"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^1", "Dance 415", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi416"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^2", "Dance 416", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi417"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^3", "Dance 417", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi418"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^4", "Dance 418", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi419"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^5", "Dance 419", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi420"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^6", "Dance 420", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi421"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^1", "Dance 421", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi422"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^2", "Dance 422", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi423"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^3", "Dance 423", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi424"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^4", "Dance 424", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi425"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^5", "Dance 425", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi426"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v1_male^6", "Dance 426", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi427"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^1", "Dance 427", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi428"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^2", "Dance 428", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi429"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^3", "Dance 429", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi430"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^4", "Dance 430", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi431"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^5", "Dance 431", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi432"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_09_v2_male^6", "Dance 432", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi433"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^1", "Dance 433", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi434"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^2", "Dance 434", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi435"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^3", "Dance 435", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi436"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^4", "Dance 436", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi437"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^5", "Dance 437", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi438"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_11_v1_male^6", "Dance 438", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi453"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^1", "Dance 453", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi454"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^2", "Dance 454", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi455"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^3", "Dance 455", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi456"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^4", "Dance 456", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi457"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^5", "Dance 457", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi458"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v1_male^6", "Dance 458", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi459"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^1", "Dance 459", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi460"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^2", "Dance 460", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi461"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^3", "Dance 461", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi462"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^4", "Dance 462", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi463"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^5", "Dance 463", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi464"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_13_v2_male^6", "Dance 464", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi465"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^1", "Dance 465", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi466"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^2", "Dance 466", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi467"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^3", "Dance 467", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi468"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^4", "Dance 468", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi469"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^5", "Dance 469", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi470"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v1_male^6", "Dance 470", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi471"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^1", "Dance 471", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi472"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^2", "Dance 472", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi473"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^3", "Dance 473", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi474"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^4", "Dance 474", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi475"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^5", "Dance 475", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi476"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_15_v2_male^6", "Dance 476", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi477"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^1", "Dance 477", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi478"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^2", "Dance 478", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi479"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^3", "Dance 479", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi480"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^4", "Dance 480", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi481"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^5", "Dance 481", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi482"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v1_male^6", "Dance 482", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi483"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_male^1", "Dance 483", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi484"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_male^2", "Dance 484", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi485"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_male^3", "Dance 485", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi486"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_male^4", "Dance 486", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi487"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_male^5", "Dance 487", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi488"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@med_intensity", "mi_dance_facedj_17_v2_male^6", "Dance 488", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi489"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_09_v1_male^1", "Dance 489", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi490"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_09_v1_male^2", "Dance 490", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi491"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_09_v2_male^1", "Dance 491", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi492"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_09_v2_male^2", "Dance 492", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi493"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_11_v1_male^1", "Dance 493", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi494"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_11_v1_male^2", "Dance 494", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi495"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_11_v2_male^1", "Dance 495", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi496"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_11_v2_male^2", "Dance 496", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi497"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_13_v1_male^1", "Dance 497", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi498"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_13_v1_male^2", "Dance 498", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi499"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_13_v2_male^1", "Dance 499", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi500"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_13_v2_male^2", "Dance 500", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi501"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_15_v1_male^1", "Dance 501", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi502"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_15_v1_male^2", "Dance 502", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi503"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_15_v2_male^1", "Dance 503", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi504"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_15_v2_male^2", "Dance 504", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi505"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_17_v1_male^1", "Dance 505", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi506"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_17_v1_male^2", "Dance 506", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi507"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_17_v2_male^1", "Dance 507", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi508"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "mi_dance_crowd_17_v2_male^2", "Dance 508", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi509"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_09_v1_male^1", "Dance 509", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi510"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_09_v2_male^1", "Dance 510", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi511"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_11_v1_male^1", "Dance 511", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi512"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_11_v2_male^1", "Dance 512", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi513"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v1_male^1", "Dance 513", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi514"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v2_male^1", "Dance 514", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi515"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_15_v1_male^1", "Dance 515", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi516"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_15_v2_male^1", "Dance 516", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi517"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_17_v1_male^1", "Dance 517", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi518"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_17_v2_male^1", "Dance 518", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi519"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_17_v2_male_^2", "Dance 519", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi520"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_15_v2_male_^2", "Dance 520", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi521"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_17_v1_male_^2", "Dance 521", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi522"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_15_v1_male_^2", "Dance 522", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi523"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v2_male_^2", "Dance 523", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi524"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v1_male_^2", "Dance 524", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi525"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_11_v2_male_^2", "Dance 525", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi526"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_11_v1_male_^2", "Dance 526", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi527"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_09_v2_male_^2", "Dance 527", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi528"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_09_v1_male_^2", "Dance 528", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi529"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_06_base_v1_laz", "Dance 529", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi530"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_06_base_v2_laz", "Dance 530", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi531"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_09_pointdj_l_laz", "Dance 531", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi532"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_09_pointdj_r_laz", "Dance 532", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi533"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_11_pointthrust_laz", "Dance 533", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi534"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_11_simplepoint_laz", "Dance 534", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi535"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_11_takebreath_laz", "Dance 535", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi536"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_13_enticing_laz", "Dance 536", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi537"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_13_turnaround_laz", "Dance 537", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi538"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_15_robot_laz", "Dance 538", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi539"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_15_shimmy_laz", "Dance 539", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi540"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_17_crotchgrab_laz", "Dance 540", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi541"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_17_teapotthrust_laz", "Dance 541", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi542"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_09_v1_male^1", "Dance 542", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi543"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_09_v2_male^1", "Dance 543", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi544"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_11_v1_male^1", "Dance 544", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi545"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_11_v2_male^1", "Dance 545", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi546"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_13_v1_male^1", "Dance 546", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi547"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_13_v2_male^1", "Dance 547", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi548"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_15_v1_male^1", "Dance 548", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi549"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_15_v2_male^1", "Dance 549", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi550"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_17_v1_male^1", "Dance 550", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi551"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "mi_dance_crowd_17_v2_male^1", "Dance 551", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi552"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_17_v1_male^1", "Dance 552", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi553"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_17_v2_male^1", "Dance 553", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi554"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_09_v1_male^1", "Dance 554", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi555"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_09_v2_male^1", "Dance 555", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi556"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_11_v1_male^1", "Dance 556", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi557"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_11_v2_male^1", "Dance 557", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi558"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_13_v1_male^1", "Dance 558", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi559"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_13_v2_male^1", "Dance 559", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi560"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_15_v1_male^1", "Dance 560", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dmi561"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "mi_dance_crowd_15_v2_male^1", "Dance 561", AnimationOptions =
        {
            EmoteLoop = true,
        }},

}


DP.HiDan = {
    ["dhi001"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^1", "Dance 001", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi002"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^2", "Dance 002", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi003"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^3", "Dance 003", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi004"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^4", "Dance 004", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi005"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^5", "Dance 005", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi006"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^6", "Dance 006", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi007"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^1", "Dance 007", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi008"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^2", "Dance 008", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi009"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^3", "Dance 009", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi010"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^4", "Dance 010", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi011"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^5", "Dance 011", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi012"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^6", "Dance 012", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi013"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^1", "Dance 013", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi014"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^2", "Dance 014", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi015"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^3", "Dance 015", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi016"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^4", "Dance 016", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi017"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^5", "Dance 017", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi018"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^6", "Dance 018", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi019"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_male^1", "Dance 019", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi020"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_male^2", "Dance 020", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi021"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_male^3", "Dance 021", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi022"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_male^4", "Dance 022", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi023"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_male^5", "Dance 023", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi024"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v2_male^6", "Dance 024", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi025"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^1", "Dance 025", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi026"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^2", "Dance 026", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi027"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^3", "Dance 027", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi028"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^4", "Dance 028", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi029"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^5", "Dance 029", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi030"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^6", "Dance 030", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi031"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^1", "Dance 031", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi032"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^2", "Dance 032", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi033"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^3", "Dance 033", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi034"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^4", "Dance 034", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi035"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^5", "Dance 035", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi036"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^6", "Dance 036", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi037"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^1", "Dance 037", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi038"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^2", "Dance 038", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi039"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^3", "Dance 039", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi040"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^4", "Dance 040", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi041"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^5", "Dance 041", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi042"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^6", "Dance 042", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi043"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_male^1", "Dance 043", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi044"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_male^2", "Dance 044", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi045"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_male^3", "Dance 045", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi046"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_male^4", "Dance 046", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi047"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_male^5", "Dance 047", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi048"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v2_male^6", "Dance 048", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi049"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^1", "Dance 049", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi050"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^2", "Dance 050", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi051"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^3", "Dance 051", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi052"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^4", "Dance 052", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi053"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^5", "Dance 053", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi054"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^6", "Dance 054", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi055"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^1", "Dance 055", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi056"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^2", "Dance 056", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi057"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^3", "Dance 057", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi058"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^4", "Dance 058", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi059"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^5", "Dance 059", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi060"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^6", "Dance 060", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi061"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m01", "Dance 061", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi062"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m02", "Dance 062", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi063"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m03", "Dance 063", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi064"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m04", "Dance 064", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi065"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m05", "Dance 065", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi066"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_b_m01", "Dance 066", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi067"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_b_m02", "Dance 067", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi068"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_b_m03", "Dance 068", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi069"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_b_m04", "Dance 069", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi070"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_b_m05", "Dance 070", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi071"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_c_m01", "Dance 071", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi072"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_c_m02", "Dance 072", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi073"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_c_m03", "Dance 073", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi074"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_c_m04", "Dance 074", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi075"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_c_m05", "Dance 075", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi076"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_d_m01", "Dance 076", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi077"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_d_m02", "Dance 077", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi078"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_d_m03", "Dance 078", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi079"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_d_m04", "Dance 079", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi080"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_d_m05", "Dance 080", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi081"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_loop_m01", "Dance 081", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi082"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_loop_m02", "Dance 082", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi083"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_loop_m03", "Dance 083", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi084"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_loop_m04", "Dance 084", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi085"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_loop_m05", "Dance 085", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi071"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^1", "Dance 071", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi072"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^2", "Dance 072", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi073"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^3", "Dance 073", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi074"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^4", "Dance 074", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi075"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^5", "Dance 075", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi076"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^6", "Dance 076", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi077"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^1", "Dance 077", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi078"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^2", "Dance 078", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi079"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^3", "Dance 079", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi080"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^4", "Dance 080", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi081"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^5", "Dance 081", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi082"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^6", "Dance 082", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi083"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^1", "Dance 083", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi084"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^2", "Dance 084", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi085"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^3", "Dance 085", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi086"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^4", "Dance 086", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi087"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^5", "Dance 087", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi088"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^6", "Dance 088", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi089"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^1", "Dance 089", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi090"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^2", "Dance 090", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi091"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^3", "Dance 091", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi092"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^4", "Dance 092", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi093"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^5", "Dance 093", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi094"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^6", "Dance 094", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi095"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_male^1", "Dance 095", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi096"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_male^2", "Dance 096", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi097"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_male^3", "Dance 097", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi098"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_male^4", "Dance 098", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi099"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_male^5", "Dance 099", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi100"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v1_male^6", "Dance 100", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi101"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^1", "Dance 101", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi102"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^2", "Dance 102", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi103"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^3", "Dance 103", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi104"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^4", "Dance 104", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi105"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^5", "Dance 105", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi106"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^6", "Dance 106", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi107"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_male^1", "Dance 107", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi108"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_male^2", "Dance 108", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi109"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_male^3", "Dance 109", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi110"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_male^4", "Dance 110", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi111"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_male^5", "Dance 111", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi112"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v1_male^6", "Dance 112", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi113"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_male^1", "Dance 113", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi114"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_male^2", "Dance 114", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi115"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_male^3", "Dance 115", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi116"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_male^4", "Dance 116", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi117"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_male^5", "Dance 117", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi118"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_15_v2_male^6", "Dance 118", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi119"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^1", "Dance 119", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi120"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^2", "Dance 120", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi121"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^3", "Dance 121", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi122"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^4", "Dance 122", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi123"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^5", "Dance 123", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi124"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^6", "Dance 124", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi125"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^1", "Dance 125", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi126"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^2", "Dance 126", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi127"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^3", "Dance 127", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi128"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^4", "Dance 128", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi129"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^5", "Dance 129", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi130"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^6", "Dance 130", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi131"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_male^1", "Dance 131", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi132"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_male^2", "Dance 132", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi133"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_male^3", "Dance 133", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi134"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_male^4", "Dance 134", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi135"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_male^5", "Dance 135", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi136"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_male^6", "Dance 136", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi137"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^1", "Dance 137", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi138"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^2", "Dance 138", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi139"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^3", "Dance 139", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi140"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^4", "Dance 140", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi141"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^5", "Dance 141", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi142"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v2_male^6", "Dance 142", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi143"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_male^1", "Dance 143", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi144"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_male^2", "Dance 144", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi145"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_male^3", "Dance 145", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi146"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_male^4", "Dance 146", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi147"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_male^5", "Dance 147", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi148"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_11_v1_male^6", "Dance 148", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi149"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_male^1", "Dance 149", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi150"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_male^2", "Dance 150", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi151"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_male^3", "Dance 151", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi152"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_male^4", "Dance 152", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi153"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_male^5", "Dance 153", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi154"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_13_v2_male^6", "Dance 154", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi155"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_male^1", "Dance 155", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi156"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_male^2", "Dance 156", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi157"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_male^3", "Dance 157", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi158"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_male^4", "Dance 158", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi159"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_male^5", "Dance 159", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi160"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v1_male^6", "Dance 160", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi161"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_male^1", "Dance 161", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi162"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_male^2", "Dance 162", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi163"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_male^3", "Dance 163", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi164"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_male^4", "Dance 164", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi165"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_male^5", "Dance 165", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi166"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_15_v2_male^6", "Dance 166", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi167"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_male^1", "Dance 167", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi168"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_male^2", "Dance 168", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi169"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_male^3", "Dance 169", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi170"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_male^4", "Dance 170", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi171"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_male^5", "Dance 171", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi172"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v1_male^6", "Dance 172", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi173"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_male^1", "Dance 173", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi174"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_male^2", "Dance 174", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi175"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_male^3", "Dance 175", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi176"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_male^4", "Dance 176", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi177"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_male^5", "Dance 177", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi178"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_17_v2_male^6", "Dance 178", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi179"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_male^1", "Dance 179", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi180"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_male^2", "Dance 180", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi181"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_male^3", "Dance 181", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi182"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_male^4", "Dance 182", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi183"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_male^5", "Dance 183", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi184"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_male^6", "Dance 184", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi185"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_male^1", "Dance 185", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi186"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_male^2", "Dance 186", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi187"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_male^3", "Dance 187", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi188"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_male^4", "Dance 188", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi189"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_male^5", "Dance 189", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi190"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v2_male^6", "Dance 190", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi191"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_male^1", "Dance 191", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi192"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_male^2", "Dance 192", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi193"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_male^3", "Dance 193", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi194"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_male^4", "Dance 194", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi195"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_male^5", "Dance 195", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi196"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_11_v1_male^6", "Dance 196", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi197"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_male^1", "Dance 197", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi198"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_male^2", "Dance 198", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi199"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_male^3", "Dance 199", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi200"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_male^4", "Dance 200", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi201"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_male^5", "Dance 201", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi202"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_male^6", "Dance 202", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi203"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_male^1", "Dance 203", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi204"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_male^2", "Dance 204", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi205"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_male^3", "Dance 205", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi206"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_male^4", "Dance 206", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi207"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_male^5", "Dance 207", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi208"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v1_male^6", "Dance 208", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi209"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_male^1", "Dance 209", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi210"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_male^2", "Dance 210", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi211"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_male^3", "Dance 211", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi212"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_male^4", "Dance 212", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi213"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_male^5", "Dance 213", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi214"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_15_v2_male^6", "Dance 214", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi215"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_male^1", "Dance 215", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi216"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_male^2", "Dance 216", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi217"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_male^3", "Dance 217", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi218"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_male^4", "Dance 218", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi219"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_male^5", "Dance 219", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi220"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v1_male^6", "Dance 220", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi221"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_male^1", "Dance 221", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi222"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_male^2", "Dance 222", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi223"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_male^3", "Dance 223", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi224"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_male^4", "Dance 224", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi225"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_male^5", "Dance 225", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi226"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_17_v2_male^6", "Dance 226", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi227"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_a_m01", "Dance 227", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi228"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_a_m02", "Dance 228", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi229"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_a_m03", "Dance 229", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi230"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_b_m01", "Dance 230", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi231"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_b_m02", "Dance 231", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi232"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_b_m03", "Dance 232", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi233"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_c_m01", "Dance 233", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi234"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_c_m02", "Dance 234", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi235"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_c_m03", "Dance 235", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi236"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_d_m01", "Dance 236", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi237"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_d_m02", "Dance 237", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi238"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_d_m03", "Dance 238", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi239"] = {"anim@amb@nightclub_island@dancers@club@", "hi_loop_m01", "Dance 239", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi240"] = {"anim@amb@nightclub_island@dancers@club@", "hi_loop_m02", "Dance 240", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi241"] = {"anim@amb@nightclub_island@dancers@club@", "hi_loop_m03", "Dance 241", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi244"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^1", "Dance 244", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi245"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^2", "Dance 245", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi246"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^3", "Dance 246", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi247"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^4", "Dance 247", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi248"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^5", "Dance 248", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi249"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^6", "Dance 249", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi250"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^1", "Dance 250", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi251"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^2", "Dance 251", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi252"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^3", "Dance 252", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi253"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^4", "Dance 253", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi254"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^5", "Dance 254", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi255"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^6", "Dance 255", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi256"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^1", "Dance 256", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi257"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^2", "Dance 257", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi258"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^3", "Dance 258", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi259"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^4", "Dance 259", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi260"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^5", "Dance 260", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi261"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^6", "Dance 261", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi262"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^1", "Dance 262", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi263"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^2", "Dance 263", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi264"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^3", "Dance 264", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi265"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^4", "Dance 265", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi266"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^5", "Dance 266", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi267"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_13_v2_male^6", "Dance 267", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi268"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^1", "Dance 268", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi269"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^2", "Dance 269", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi270"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^3", "Dance 270", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi271"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^4", "Dance 271", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi272"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^5", "Dance 272", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi273"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v1_male^6", "Dance 273", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi274"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^1", "Dance 274", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi275"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^2", "Dance 275", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi276"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^3", "Dance 276", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi277"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^4", "Dance 277", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi278"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^5", "Dance 278", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi279"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_17_v2_male^6", "Dance 279", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi280"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_male^1", "Dance 280", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi281"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_male^2", "Dance 281", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi282"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_male^3", "Dance 282", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi283"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_male^4", "Dance 283", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi284"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_male^5", "Dance 284", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi285"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_d_11_v2_male^6", "Dance 285", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi285"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_male^1", "Dance 285", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi286"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_male^2", "Dance 286", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi287"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_male^3", "Dance 287", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi288"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_male^4", "Dance 288", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi289"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_male^5", "Dance 289", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi290"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_male^6", "Dance 290", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi291"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_male^1", "Dance 291", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi292"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_male^2", "Dance 292", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi293"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_male^3", "Dance 293", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi294"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_male^4", "Dance 294", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi295"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_male^5", "Dance 295", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi296"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_09_male^6", "Dance 296", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi297"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_male^1", "Dance 297", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi298"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_male^2", "Dance 298", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi299"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_male^3", "Dance 299", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi300"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_male^4", "Dance 300", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi301"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_male^5", "Dance 301", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi302"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_11_male^6", "Dance 302", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi303"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_male^1", "Dance 303", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi304"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_male^2", "Dance 304", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi305"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_male^3", "Dance 305", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi306"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_male^4", "Dance 306", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi307"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_male^5", "Dance 307", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi308"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_male^6", "Dance 308", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi309"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^1", "Dance 309", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi310"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^2", "Dance 310", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi311"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^3", "Dance 311", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi312"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^4", "Dance 312", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi313"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^5", "Dance 313", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi314"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^6", "Dance 314", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi315"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_male^1", "Dance315", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi316"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_male^2", "Dance316", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi317"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_male^3", "Dance317", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi318"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_male^4", "Dance318", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi319"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_male^5", "Dance319", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi320"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_13_v1_male^6", "Dance320", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi321"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_male^1", "Dance321", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi322"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_male^2", "Dance322", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi323"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_male^3", "Dance323", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi324"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_male^4", "Dance324", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi325"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_male^5", "Dance325", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi326"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v1_male^6", "Dance326", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi327"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^1", "Dance327", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi328"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^2", "Dance328", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi329"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^3", "Dance329", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi330"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^4", "Dance330", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi331"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^5", "Dance331", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi332"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^6", "Dance332", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi333"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^1", "Dance 333", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi334"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^2", "Dance 334", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi335"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^3", "Dance 335", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi336"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^4", "Dance 336", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi337"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^5", "Dance 337", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi338"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_male^6", "Dance 338", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi339"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^1", "Dance 339", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi340"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^2", "Dance 340", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi341"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^3", "Dance 341", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi342"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^4", "Dance 342", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi343"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^5", "Dance 343", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi344"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^6", "Dance 344", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi345"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^1", "Dance 345", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi346"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^2", "Dance 346", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi347"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^3", "Dance 347", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi348"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^4", "Dance 348", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi349"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^5", "Dance 349", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi350"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_11_v1_male^6", "Dance 350", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi351"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^1", "Dance 351", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi352"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^2", "Dance 352", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi353"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^3", "Dance 353", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi354"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^4", "Dance 354", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi355"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^5", "Dance 355", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi356"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v1_male^6", "Dance 356", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi357"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^1", "Dance 357", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi358"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^2", "Dance 358", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi359"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^3", "Dance 359", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi360"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^4", "Dance 360", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi361"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^5", "Dance 361", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi362"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_13_v2_male^6", "Dance 362", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi363"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^1", "Dance 363", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi364"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^2", "Dance 364", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi365"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^3", "Dance 365", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi366"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^4", "Dance 366", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi367"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^5", "Dance 367", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi368"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_15_v1_male^6", "Dance 368", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi369"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^1", "Dance 369", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi370"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^2", "Dance 370", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi371"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^3", "Dance 371", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi372"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^4", "Dance 372", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi373"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^5", "Dance 373", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi374"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v1_male^6", "Dance 374", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi375"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^1", "Dance 375", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi376"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^2", "Dance 376", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi377"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^3", "Dance 377", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi378"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^4", "Dance 378", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi379"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^5", "Dance 379", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi380"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_17_v2_male^6", "Dance 380", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi381"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_male^1", "Dance 381", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi382"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_male^2", "Dance 382", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi383"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_male^3", "Dance 383", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi384"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_male^4", "Dance 384", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi385"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_male^5", "Dance 385", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi386"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_d_11_v2_male^6", "Dance 386", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi387"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_male^1", "Dance 387", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi388"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_male^2", "Dance 388", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi389"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_male^3", "Dance 389", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi390"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_male^4", "Dance 390", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi391"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_male^5", "Dance 391", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi392"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_13_v1_male^6", "Dance 392", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi393"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_male^1", "Dance 393", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi394"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_male^2", "Dance 394", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi395"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_male^3", "Dance 395", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi396"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_male^4", "Dance 396", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi397"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_male^5", "Dance 397", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi398"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_hu_15_v1_male^6", "Dance 398", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi399"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_09_v1_male_^2", "Dance 399", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi400"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_09_v2_male_^2", "Dance 400", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi401"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_11_v1_male_^2", "Dance 401", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi402"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_11_v2_male_^2", "Dance 402", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi403"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_13_v1_male_^2", "Dance 403", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi404"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_15_v1_male_^2", "Dance 404", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi405"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_17_v1_male_^2", "Dance 405", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi406"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_17_v2_male_^2", "Dance 406", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi407"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_15_v2_male_^2", "Dance 407", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi408"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v1_male^1", "Dance 408", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi409"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_09_v2_male^1", "Dance 409", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi410"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v1_male^1", "Dance 410", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi411"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_11_v2_male^1", "Dance 411", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi412"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v1_male^1", "Dance 412", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi413"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v2_male^1", "Dance 413", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi414"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v1_male^1", "Dance 414", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi415"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v2_male^1", "Dance 415", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi416"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v1_male^1", "Dance 416", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi417"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v2_male^1", "Dance 417", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi418"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_09_v1_male^1", "Dance 418", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi419"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_09_v1_male^2", "Dance 419", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi420"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_09_v2_male^1", "Dance 420", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi421"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_09_v2_male^2", "Dance 421", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi422"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_11_v1_male^1", "Dance 422", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi423"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_11_v1_male^2", "Dance 423", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi424"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_11_v2_male^1", "Dance 424", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi425"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_11_v2_male^2", "Dance 425", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi426"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_13_v1_male^1", "Dance 426", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi427"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_13_v1_male^2", "Dance 427", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi428"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_13_v2_male^1", "Dance 428", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi429"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_13_v2_male^2", "Dance 429", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi430"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_15_v1_male^1", "Dance 430", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi431"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_15_v1_male^2", "Dance 431", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi432"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_15_v2_male^1", "Dance 432", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi433"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_15_v2_male^2", "Dance 433", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi434"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_17_v1_male^1", "Dance 434", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi435"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_17_v1_male^2", "Dance 435", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi436"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_17_v2_male^1", "Dance 436", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi437"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupc@", "hi_dance_crowd_17_v2_male^2", "Dance 437", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi438"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_09_v1_male^1", "Dance 438", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi439"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_09_v2_male^1", "Dance 439", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi440"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_11_v1_male^1", "Dance 440", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi441"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_11_v2_male^1", "Dance 441", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi442"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_13_v1_male^1", "Dance 442", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi443"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_13_v2_male^1", "Dance 443", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi444"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_13_v2_male^1", "Dance 444", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi445"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_15_v1_male^1", "Dance 445", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi446"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_15_v2_male^1", "Dance 446", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi447"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_17_v1_male^1", "Dance 447", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi448"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_17_v2_male^1", "Dance 448", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi449"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_09_v1_male^1", "Dance 449", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi450"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_09_v2_male^1", "Dance 450", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi451"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_11_v1_male^1", "Dance 451", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi452"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_11_v2_male^1", "Dance 452", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi453"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_13_v1_male^1", "Dance 453", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi454"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_13_v2_male^1", "Dance 454", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi455"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_15_v1_male^1", "Dance 455", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi456"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_15_v2_male^1", "Dance 456", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi457"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v1_male^1", "Dance 457", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi458"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v2_male^1", "Dance 458", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi459"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_06_base_laz", "Dance 459", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi460"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_13_flyingv_laz", "Dance 460", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi461"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_06_base_v2_laz", "Dance 461", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi462"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_17_smackthat_laz", "Dance 462", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi463"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_17_spiderman_laz", "Dance 463", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi464"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_takebreath_laz", "Dance 464", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi465"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_turnaround_laz", "Dance 465", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi466"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_13_crotchgrab_laz", "Dance 466", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi467"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_15_crazyrobot_laz", "Dance 467", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi468"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_15_lookaround_laz", "Dance 468", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi469"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Dance 469", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi470"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_f_laz", "Dance 470", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["dhi487"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_a_m01", "Dance 487", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi488"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_a_m02", "Dance 488", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi489"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_a_m03", "Dance 489", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi490"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_a_m04", "Dance 490", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi491"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_a_m05", "Dance 491", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi492"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_b_m01", "Dance 492", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi493"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_b_m02", "Dance 493", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi494"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_b_m03", "Dance 494", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi495"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_b_m05", "Dance 495", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi496"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_c_m01", "Dance 496", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi497"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_c_m02", "Dance 497", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi498"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_c_m03", "Dance 498", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi499"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_c_m04", "Dance 499", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi500"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_idle_c_m05", "Dance 500", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi501"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_loop_m01", "Dance 501", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi502"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_loop_m02", "Dance 502", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi503"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_loop_m03", "Dance 503", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi504"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_loop_m04", "Dance 504", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi505"] = {"anim@amb@nightclub_island@dancers@beachdance@", "ti_loop_m05", "Dance 505", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi506"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_a_m01", "Dance 506", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi507"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_a_m02", "Dance 507", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi508"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_a_m03", "Dance 508", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi509"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_b_m01", "Dance 509", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi510"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_b_m02", "Dance 510", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi511"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_b_m03", "Dance 511", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi512"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_c_m01", "Dance 512", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi513"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_c_m02", "Dance 513", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi514"] = {"anim@amb@nightclub_island@dancers@club@", "ti_idle_c_m03", "Dance 514", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi515"] = {"anim@amb@nightclub_island@dancers@club@", "ti_loop_m01", "Dance 515", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi516"] = {"anim@amb@nightclub_island@dancers@club@", "ti_loop_m02", "Dance 516", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi517"] = {"anim@amb@nightclub_island@dancers@club@", "ti_loop_m03", "Dance 517", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi518"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_09_v1_male^1", "Dance 518", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi519"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_09_v2_male^1", "Dance 519", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi520"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_11_v1_male^1", "Dance 520", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi521"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_11_v2_male^1", "Dance 521", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi522"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_13_v1_male^1", "Dance 522", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi523"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_13_v2_male^1", "Dance 523", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi524"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_15_v1_male^1", "Dance 524", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi525"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_15_v2_male^1", "Dance 525", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi526"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v1_male^1", "Dance 526", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi527"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupa@", "hi_dance_crowd_17_v2_male^1", "Dance 527", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi528"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "hi_dance_crowd_15_v2_male_^2", "Dance 528", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi529"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v1_male^1", "Dance 529", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi530"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_13_v2_male^1", "Dance 530", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi531"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v1_male^1", "Dance 531", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi532"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_15_v2_male^1", "Dance 532", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi533"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v1_male^1", "Dance 533", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["dhi534"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupe@", "hi_dance_crowd_17_v2_male^1", "Dance 534", AnimationOptions =
        {
            EmoteLoop = true,
        }},
}






DP.Emotes = {}

DP.Smoke = {
    ["smoke14"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_a", "Smoke 14", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke15"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke 15", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke16"] = {"amb@world_human_leaning@female@smoke@base", "base", "Smoke 16", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke17"] = {"amb@world_human_leaning@female@smoke@idle_a", "idle_a", "Smoke 17", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["endsmoke"] = {"anim@heists@team_respawn@variations@variation_a", "respawn_a_ped_d_smoke", "End smoke", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["endsmoke2"] = {"anim@heists@team_respawn@variations@variation_b", "respawn_b_ped_b_smoke", "End smoke 2", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["ednsmoke3"] = {"anim@heists@team_respawn@variations@variation_b", "respawn_b_ped_d_smoke", "End smoke 3", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["smoke13"] = {"anim@amb@carmeet@checkout_car@smoke@female_a@idles", "idle_b", "Smoke 13", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke12"] = {"anim@amb@carmeet@checkout_car@smoke@female_a@idles", "idle_c", "Smoke 12", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke13"] = {"anim@amb@carmeet@checkout_car@smoke@female_a@idles", "idle_d", "Smoke 13", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke14"] = {"anim@amb@carmeet@checkout_car@smoke@male_a@idles", "idle_a", "Smoke 14", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke15"] = {"anim@amb@carmeet@checkout_car@smoke@male_a@idles", "idle_b", "Smoke 15", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke16"] = {"anim@amb@carmeet@checkout_car@smoke@male_a@idles", "idle_c", "Smoke 16", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke17"] = {"anim@amb@carmeet@checkout_car@smoke@male_a@idles", "idle_d", "Smoke 17", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke05"] = {"anim@amb@carmeet@checkout_car@smoke@male_a@trans", "a_trans_c", "Smoke 05", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke06"] = {"anim@amb@carmeet@checkout_car@smoke@male_b@trans", "b_trans_a", "Smoke 06", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke07"] = {"anim@amb@carmeet@checkout_car@smoke@male_c@idles", "idle_a", "Smoke 07", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke08"] = {"anim@amb@carmeet@checkout_car@smoke@male_c@idles", "idle_b", "Smoke 08", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke09"] = {"anim@amb@carmeet@checkout_car@", "smoke_female_a_idle_b", "Smoke 09", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke10"] = {"anim@amb@carmeet@checkout_car@", "smoke_male_c_idle_b", "Smoke 10", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["smoke"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Smoke"},
    ["smokeweed"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Smoke Weed"},
    
    ["smoke02"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke 02", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["smoke03"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke 03", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["smoke04"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Smoke 04", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
}

DP.Reaction = {
    ["think6"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@01a@base", "base", "Think 6"},
    ["impartial"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@01a@reacts@v01", "reaction_impartial_var03", "Impartial"},
    ["terrible"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@01a@reacts@v01", "reaction_terrible", "Terrible"},
    ["bad"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@01b@reacts@vo1", "reaction_bad_var01", "Bad", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["terrible2"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@01b@reacts@vo1", "reaction_terrible", "Terrible 2"},
    ["bad2"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@02a@reacts@v01", "reaction_bad_var02", "Bad 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["terrible3"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@02a@reacts@v01", "reaction_terrible", "Terrible 3"},
    ["blown"] = {"anim@mp_player_intuppermind_blown", "exit", "Blown"},
    ["smell"] = {"anim@mp_player_intupperstinker", "enter", "Smell"},
    ["smell2"] = {"anim@mp_player_intupperstinker", "idle_a", "Smell 2"},
    ["crybaby"] = {"anim@mp_player_intcelebrationfemale@cry_baby", "cry_baby", "Cry baby"},
    ["cutthroat"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Cut throat"},
    ["mindblown"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Mind blown"},
    ["stinker"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Stinker"},
    ["crybaby2"] = {"anim@mp_player_intcelebrationmale@cry_baby", "cry_baby", "Cry baby 2"},
    ["cutthroat3"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Cut throat 2"},
    ["mindblown2"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Mind blown2"},
    ["stinker2"] = {"anim@mp_player_intcelebrationmale@stinker", "stinker", "Stinker 2"},
    ["yesbe"] = {"anim@arena@prize_wheel@female", "win_exit_c", "Yes be"},
    ["yesbe2"] = {"anim@arena@prize_wheel@male", "exit_win", "Yes be 2"},
    ["yesbe3"] = {"anim@arena@prize_wheel@male", "win_exit_b", "Yes be 3"},
    ["fuckyou"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_b_player_a", "Fuck you"},
    ["fuckyou2"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_b_player_b", "Fuck you 2"},
    ["angryclap"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Angry clap"},
    ["shh"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_a", "Shh"},
    ["taunt"] = {"anim@arena@celeb@flat@solo@no_props@", "taunt_d_player_b", "Taunt"},
    ["taunt2"] = {"anim@arena@celeb@flat@solo@no_props@", "taunt_e_player_b", "Taunt 2"},
    ["yesbutno"] = {"anim@arena@celeb@flat@solo@no_props@", "thumbs_down_a_player_a", "Yes but no"},
    ["cheering"] = {"anim@amb@nightclub@peds@", "amb_world_human_cheering_female_c", "Cheering"},
    ["outofbreath"] = {"re@construction", "out_of_breath", "Out of breath"},
    ["crying"] = {"switch@trevor@floyd_crying", "console_get_along_end_loop_floyd", "Crying", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["thinkalittle"] = {"gestures@miss@fra_0", "lamar_fkn0_cjae_01_g4", "Think a little"},
    ["idiot"] = {"oddjobs@bailbond_hobodepressed", "idle_a", "Idiot", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lose3"] = {"oddjobs@towingpleadingidle_b", "idle_d", "Lose 3"},
    ["lose2"] = {"oddjobs@towingangryidle_a", "idle_b", "Lose 2"},
    ["lose"] = {"oddjobs@towingangryidle_a", "idle_a", "Lose"},
    ["looksky2"] = {"oddjobs@basejump@", "ped_a_loop", "Look sky2"},
    ["looksky"] = {"oddjobs@basejump@", "ped_d_loop", "Look sky"},
    ["argue3"] = {"oddjobs@bailbond_mountain", "excited_idle_a", "Argue 3"},
    ["sleep"] = {"mp_sleep", "sleep_intro", "Sleep"},
    ["think7"] = {"rcmnigel3", "base", "Think 7", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["impatient"] = {"friends@frf@ig_1", "impatient_idle_c", "Impatient"},
    ["comeon2"] = {"friends@frf@ig_1", "over_here_idle_b", "Come on 2"},
    ["comeon"] = {"friends@frf@ig_1", "over_here_idle_a", "Come on"},
    ["reject"] = {"mini@hookers_sp", "idle_reject", "Reject"},
    ["cheering2"] = {"anim@amb@nightclub@djs@switch@bmad_djset_switchover@", "bmad_enter_bg_female3", "Cheering 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["cheering3"] = {"mini@triathlon", "male_two_handed_a", "Cheering 3"},
    ["cheering4"] = {"mini@triathlon", "male_one_handed_a", "Cheering 4"},
    ["disgusted"] = {"anim_heist@arcade@fortune@female@", "reaction_disgusted", "Disgusted"},
    ["angry"] = {"anim_heist@arcade@fortune@female@", "reaction_angry", "Angry"},
    ["yesbe3"] = {"anim_heist@arcade@love@female@left@", "friendzoned_perfect", "Yes be 3"},
    ["fuckyou3"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Fuck you 3"},
    ["fuckyou5"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Fuck you 5"},
    ["fuckyou4"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_b_1st", "Fuck you 4"},
    ["stupid"] = {"anim@amb@casino@out_of_money@ped_male@01b@base", "base", "Stupid", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stupid2"] = {"anim@amb@casino@out_of_money@ped_male@01b@idles", "idle_a", "Stupid 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stupid3"] = {"anim@amb@casino@out_of_money@ped_male@01b@idles", "idle_b", "Stupid 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stupid4"] = {"anim@amb@casino@out_of_money@ped_male@01b@idles", "idle_d", "Stupid 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["argue"] = {"misscarsteal4@actor", "actor_berating_loop", "Argue", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["argue2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Argue 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["boi"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "BOI", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 3000,
        }},
    ["bringiton"] = {"misscommon@response", "bring_it_on", "Bring It On", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 3000
        }},
    ["celebrate"] = {"rcmfanatic1celebrate", "celebrate", "Celebrate", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["clap"] = {"amb@world_human_cheering@male_a", "base", "Clap", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["comeatmebro"] = {"mini@triathlon", "want_some_of_this", "Come at me bro", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2000
        }},
    ["countdown"] = {"random@street_race", "grid_girl_race_start", "Countdown", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["facepalm2"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Facepalm 2", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 8000
        }},
    ["facepalm"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Facepalm", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 8000
        }},
    ["facepalm3"] = {"missminuteman_1ig_2", "tasered_2", "Facepalm 3", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 8000
        }},
    ["facepalm4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Facepalm 4", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true,
        }},
    ["fallasleep"] = {"mp_sleep", "sleep_loop", "Fall Asleep", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true,
        }},
    ["foldarms"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Fold Arms", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["yeah"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Yeah", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["thumbsup3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Thumbs Up 3", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 3000,
        }},
    ["thumbsup2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Thumbs Up 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["thumbsup"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Thumbs Up", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["smell"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Smell", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["slowclap3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Slow Clap 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    
    ["slowclap"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Slow Clap", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["slowclap2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Slow Clap 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["shrug"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Shrug", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 1000,
        }},
    ["shrug2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Shrug 2", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 1000,
        }},
    ["scared"] = {"random@domestic", "f_distressed_loop", "Scared", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["scared2"] = {"random@homelandsecurity", "knees_loop_girl", "Scared 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["think5"] = {"mp_cp_welcome_tutthink", "b_think", "Think 5", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2000,
        }},
    ["think"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Think", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["think3"] = {"timetable@tracy@ig_8@base", "base", "Think 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["think2"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Think 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["think4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Think 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wave4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Wave 4", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 3000,
        }},
    ["wave2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "Wave 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wave3"] = {"friends@fra@ig_1", "over_here_idle_a", "Wave 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wave"] = {"friends@frj@ig_1", "wave_a", "Wave", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wave5"] = {"friends@frj@ig_1", "wave_b", "Wave 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wave6"] = {"friends@frj@ig_1", "wave_c", "Wave 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wave7"] = {"friends@frj@ig_1", "wave_d", "Wave 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wave8"] = {"friends@frj@ig_1", "wave_e", "Wave 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wave9"] = {"gestures@m@standing@casual", "gesture_hello", "Wave 9", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["noway"] = {"gestures@m@standing@casual", "gesture_no_way", "No Way", AnimationOptions =
        {
            EmoteDuration = 1500,
            EmoteMoving = true,
        }},

}

DP.Idle = {
    ["leanwall"] = {"anim@amb@beach_party@", "lean_female_a_idle_a", "Lean wall", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanwall2"] = {"anim@amb@beach_party@", "lean_male_b_base", "Lean wall 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable12"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@02b@idles", "idle_b", "Lean table 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable13"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_female@stand@01a@base", "base", "Lean table 13", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable14"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_female@stand@01a@idles", "idle_d", "Lean table 14", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable15"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_female@stand@01a@idles", "idle_b", "Lean table 15", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable16"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_female@stand@01a@reacts@v01", "reaction_good_var01", "Lean table 16", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable17"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_female@stand@01a@reacts@v01", "reaction_good_var02", "Lean table 17", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable18"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_female@stand@01b@idles", "idle_a", "Lean table 18", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable19"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_female@stand@02a@base", "base", "Lean table 19", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable20"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_female@stand@02a@idles", "idle_a", "Lean table 20", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["leantable03"] = {"anim@amb@world_human_valet@informal@base@", "base_a_m_y_vinewood_01", "Lean table 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable04"] = {"anim@amb@world_human_valet@informal@idle_a@", "idle_c_a_m_y_vinewood_01", "Lean table 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable05"] = {"anim@amb@world_human_valet@informal@idle_d@", "idle_k_a_m_y_vinewood_01", "Lean table 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable06"] = {"anim@amb@world_human_valet@informal@idle_e@", "idle_n_a_m_y_vinewood_01", "Lean table 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable07"] = {"anim@amb@world_human_valet@informal@idle_f@", "idle_p_a_m_y_vinewood_01", "Lean table 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable08"] = {"anim@amb@world_human_valet@informal@idle_f@", "idle_q_a_m_y_vinewood_01", "Lean table 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable09"] = {"anim@amb@world_human_valet@normal@idle_b@", "idle_d_a_m_y_vinewood_01", "Lean table 09", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable10"] = {"anim@amb@world_human_valet@normal@idle_d@", "idle_k_a_m_y_vinewood_01", "Lean table 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable11"] = {"anim@amb@world_human_valet@normal@idle_e@", "idle_n_a_m_y_vinewood_01", "Lean table 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle40"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@02a@idles", "idle_a", "Idle 40", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle41"] = {"anim_casino_a@amb@casino@games@spectate@cardtable@ped_male@stand@02a@idles", "idle_d", "Idle 41", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle42"] = {"anim@special_peds@casino@beth@wheel@", "action10_beth", "Idle 42", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle43"] = {"anim@special_peds@casino@beth@wheel@", "action8_beth", "Idle 43", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle44"] = {"anim@move_m@security_guard", "idle_var_03", "Idle 44", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle49"] = {"anim@amb@world_human_valet@formal_left@base@", "base_a_m_y_vinewood_01", "Idle 49", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle50"] = {"anim@amb@world_human_valet@formal_left@idle_c@", "idle_g_a_m_y_vinewood_01", "Idle 50", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle51"] = {"anim@amb@world_human_valet@formal_left@idle_c@", "idle_h_a_m_y_vinewood_01", "Idle 51", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle52"] = {"anim@amb@world_human_valet@formal_left@idle_c@", "idle_i_a_m_y_vinewood_01", "Idle 52", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle53"] = {"anim@amb@world_human_valet@formal_left@idle_d@", "idle_j_a_m_y_vinewood_01", "Idle 53", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle54"] = {"anim@amb@world_human_valet@formal_left@idle_d@", "idle_k_a_m_y_vinewood_01", "Idle 54", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle55"] = {"anim@amb@world_human_valet@formal_left@idle_d@", "idle_l_a_m_y_vinewood_01", "Idle 55", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle12"] = {"anim@amb@world_human_valet@formal_left@idle_f@", "idle_q_a_m_y_vinewood_01", "Idle 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle13"] = {"anim@amb@world_human_valet@formal_left@idle_f@", "idle_r_a_m_y_vinewood_01", "Idle 13", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle14"] = {"anim@amb@stand_withdrink@01a@base", "base", "Idle 14", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle15"] = {"anim@amb@casino@peds@", "amb_world_human_hang_out_street_female_hold_arm_idle_b", "Idle 15", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle16"] = {"anim@amb@casino@peds@", "amb_world_human_hang_out_street_male_c_base", "Idle 16", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle17"] = {"anim@amb@casino@peds@", "amb_world_human_stand_guard_male_base", "Idle 17", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle18"] = {"anim@amb@casino@peds@", "mini_strip_club_idles_bouncer_go_away_go_away", "Idle 18", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle19"] = {"anim@amb@casino@shop@ped_female@01a@idles", "idle_a", "Idle 19", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle20"] = {"anim@amb@casino@shop@ped_female@01a@idles", "idle_c", "Idle 20", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle21"] = {"anim@amb@casino@shop@ped_male@01a@idles", "idle_d", "Idle 21", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle22"] = {"anim@amb@casino@hangout@ped_female@stand@01a@idles", "idle_a", "Idle 22", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle23"] = {"anim@amb@casino@hangout@ped_female@stand@01a@idles", "idle_d", "Idle 23", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle24"] = {"anim@amb@casino@hangout@ped_female@stand@01b@idles", "idle_a", "Idle 24", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle25"] = {"anim@amb@casino@hangout@ped_female@stand@01b@idles", "idle_c", "Idle 25", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle26"] = {"anim@amb@casino@hangout@ped_female@stand@01b@idles_convo", "idle_a", "Idle 26", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle27"] = {"anim@amb@casino@hangout@ped_female@stand@02a@idles", "idle_d", "Idle 27", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Idle", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle08"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Idle 08"},
    ["idle09"] = {"friends@fra@ig_1", "base_idle", "Idle 09", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle10"] = {"mp_move@prostitute@m@french", "idle", "Idle 10", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["idle11"] = {"random@countrysiderobbery", "idle_a", "Idle 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle02"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Idle 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle03"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Idle 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle04"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Idle 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle05"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Idle 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle06"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Idle 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle07"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Idle 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle28"] = {"anim@amb@casino@hangout@ped_female@stand@02b@idles", "idle_a", "Idle 28", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle29"] = {"anim@amb@casino@hangout@ped_female@stand@02b@idles", "idle_d", "Idle 29", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle30"] = {"anim@amb@casino@hangout@ped_female@stand@03a@idles", "idle_b", "Idle 30", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle31"] = {"anim@amb@casino@hangout@ped_female@stand@03a@idles", "idle_d", "Idle 31", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle32"] = {"anim@amb@casino@hangout@ped_female@stand@03a@idles_convo", "idle_a", "Idle 32", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle33"] = {"anim@amb@casino@hangout@ped_female@stand@03b@idles", "idle_a", "Idle 33", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle45"] = {"anim@amb@casino@hangout@ped_female@stand@03b@idles", "idle_d", "Idle 45", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle34"] = {"anim@amb@casino@hangout@ped_female@stand@03b@idles_convo", "idle_a", "Idle 34", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle35"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Idle 35", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle36"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles_convo", "idle_a", "Idle 36", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle37"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles_convo", "idle_d", "Idle 37", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle38"] = {"anim@amb@casino@hangout@ped_male@stand@03b@idles", "idle_b", "Idle 38", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle39"] = {"anim@amb@casino@hangout@ped_male@stand@03b@idles", "idle_d", "Idle 39", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable02"] = {"anim@amb@casino@out_of_money@ped_female@02a@idles", "idle_a", "Lean table 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leantable"] = {"anim@arena@prize_wheel@male", "idle_a", "Lean table", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanbar2"] = {"misshair_shop@hair_dressers", "assistant_idle_a", "Lean bar 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanbar"] = {"misshair_shop@hair_dressers", "assistant_base", "Lean bar", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle48"] = {"oddjobs@bailbond_hobohang_out_street_b", "idle_c", "Idle 48"},
    ["idle"] = {"mp_freemode_return@f@fail", "fail_a", "Idle", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["scratching"] = {"mp_freemode_return@f@idle", "idle_a", "Scratching", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle46"] = {"mp_freemode_return@f@idle", "idle_b", "Idle 46", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["idle47"] = {"mp_freemode_return@f@idle", "idle_c", "Idle 47", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["pickupwait"] = {"friends@", "pickupwait", "Pickupwait", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["nervous"] = {"rcmme_tracey1", "nervous_loop", "Nervous", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    
    ["lean02"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Lean 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lean03"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Lean 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lean04"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Lean 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lean05"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "Lean 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanflirt"] = {"random@street_race", "_car_a_flirt_girl", "Lean Flirt", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanbar2"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "Lean Bar 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanbar3"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "Lean Bar 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanbar4"] = {"anim@heists@prison_heist", "ped_b_loop_a", "Lean Bar 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanhigh"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "Lean High", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["leanhigh2"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "Lean High 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["leanside"] = {"timetable@mime@01_gc", "idle_a", "Leanside", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["leanside2"] = {"misscarstealfinale", "packer_idle_1_trevor", "Leanside 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["leanside3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["leanside4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
    ["leanside5"] = {"rcmjosh2", "josh_2_intp1_base", "Leanside 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }},
    
    
    
    ["lean"] = {"Scenario", "WORLD_HUMAN_LEANING", "Lean"},
    ["lean6"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_lookaround_nowork", "Lean 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lean7"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Lean 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lean8"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle-noworkfemale", "Lean 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lean10"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_sleeping_nowork", "Lean 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lean11"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_sleeping-noworkfemale", "Lean 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lean12"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_stretching_nowork", "Lean 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanback3"] = {"anim@amb@clubhouse@bar@bartender@", "idle_b_bartender", "Lean back 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanback4"] = {"anim@amb@clubhouse@bar@bartender@", "idle_a_bartender", "Lean back 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanback5"] = {"anim@amb@clubhouse@bar@bartender@", "greeting_c_bartender", "Lean back 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanback6"] = {"anim@amb@clubhouse@bar@bartender@", "greeting_a_bartender", "Lean back 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanback2"] = {"anim@amb@clubhouse@bar@bartender@", "base_bartender", "Lean back 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model02"] = {"anim@amb@carmeet@checkout_engine@female_d@base", "base", "Model 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model03"] = {"anim@amb@carmeet@checkout_engine@female_c@base", "base", "Model 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model04"] = {"anim@amb@carmeet@checkout_engine@female_b@base", "base", "Model 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model"] = {"anim@amb@carmeet@checkout_car@female_c@base", "base", "Model", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model06"] = {"mini@hookers_sp", "ilde_b", "Model 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model07"] = {"missmic4premiere", "prem_4stars_a_aella", "Model 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model08"] = {"missmic4premiere", "prem_actress_star_a", "Model 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model09"] = {"mini@strip_club@idles@stripper", "stripper_idle_06", "Model 09", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model10"] = {"mini@strip_club@idles@stripper", "stripper_idle_01", "Model 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model11"] = {"mini@strip_club@idles@stripper", "stripper_idle_02", "Model 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model12"] = {"mini@strip_club@idles@stripper", "stripper_idle_03", "Model 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model13"] = {"mini@strip_club@idles@stripper", "stripper_idle_04", "Model 13", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["model14"] = {"random@street_race", "_car_a_flirt_girl", "Model 14", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["leanback"] = {"anim_heist@arcade_property@wendy@bar@", "back_bar_base", "Lean back", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["cross"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Cross", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["cross2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Cross 2", AnimationOptions =
        {
            EmoteMoving = true,
        }},
    ["cross3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Cross 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["cross4"] = {"random@street_race", "_car_b_lookout", "Cross 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["cross5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Cross 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["foldarms2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Fold Arms 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["cross6"] = {"random@shop_gunstore", "_idle", "Cross 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["crossside"] = {"rcmnigel1a_band_groupies", "base_m2", "Cross Side", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    
    ["guard"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Guard"},
    ["wait4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Wait 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["wait5"] = {"missclothing", "idle_storeclerk", "Wait 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Wait 6", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait7"] = {"rcmnigel1cnmt_1c", "base", "Wait 7", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait8"] = {"rcmjosh1", "idle", "Wait 8", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait9"] = {"rcmjosh2", "josh_2_intp1_base", "Wait 9", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Wait 10", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait11"] = {"misshair_shop@hair_dressers", "keeper_base", "Wait 11", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Wait 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["wait"] = {"random@shop_tattoo", "_idle_a", "Wait", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait2"] = {"missbigscore2aig_3", "wait_for_van_c", "Wait 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait12"] = {"rcmjosh1", "idle", "Wait 12", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["wait13"] = {"rcmnigel1a", "base", "Wait 13", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["tryclothes"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Try Clothes", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["tryclothes2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Try Clothes 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["tryclothes3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Try Clothes 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["prosthigh"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Prostitue High"},
    ["prostlow"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Prostitue Low"},
    ["leanphone"] = {"anim@amb@beach_party@", "lean_cell_phone_female_a_idle_b", "Lean with phone", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanphone2"] = {"anim@amb@beach_party@", "lean_cell_phone_female_a_idle_d", "Lean with phone 2", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanphone3"] = {"anim@amb@beach_party@", "lean_cell_phone_male_a_base", "Lean with phone 3", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanphone4"] = {"anim@amb@beach_party@", "lean_cell_phone_male_a_idle_a", "Lean with phone 4", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanphone5"] = {"anim@amb@beach_party@", "lean_cell_phone_male_a_idle_b", "Lean with phone 5", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanphone6"] = {"anim@amb@beach_party@", "lean_cell_phone_male_a_idle_c", "Lean with phone 6", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanphone7"] = {"anim@amb@beach_party@", "lean_cell_phone_male_a_idle_d", "Lean with phone 7", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drink"] = {"mp_player_inteat@pnq", "loop", "Drink", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2500,
        }},
    ["leandrink"] = {"anim@amb@beach_party@", "lean_drink_cup_female_a_idle_a", "Lean with drink", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leandrink2"] = {"anim@amb@beach_party@", "lean_drink_cup_female_a_idle_c", "Lean with drink 2", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leandrink3"] = {"anim@amb@beach_party@", "lean_drink_cup_male_a_idle_a", "Lean with drink 3", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leandrink4"] = {"anim@amb@beach_party@", "lean_drink_cup_male_a_idle_c", "Lean with drink 4", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leandrink5"] = {"anim@amb@beach_party@", "lean_drink_cup_male_a_idle_d", "Lean with drink 5", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanjoint"] = {"anim@amb@beach_party@", "lean_male_a_idle_a", "Lean with joint", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanjoint2"] = {"anim@amb@beach_party@", "lean_smoke_weed_female_a_idle_d", "Lean with joint 2", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanjoint3"] = {"anim@amb@beach_party@", "lean_smoke_weed_male_a_idle_a", "Lean with joint 3", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanjoint4"] = {"anim@amb@beach_party@", "lean_smoke_weed_male_a_idle_b", "Lean with joint 4", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanjoint5"] = {"anim@amb@beach_party@", "lean_smoke_weed_male_a_idle_c", "Lean with joint 5", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["leanjoint6"] = {"anim@amb@beach_party@", "stand_female_a_idle_a", "Lean joint 6", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
}


DP.Sit = {
    ["sitfloor11"] = {"anim@special_peds@casino@vince@wall@cas_vince_ig3", "cas_vince_ig3_best_night_ever", "Sit Floor 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor12"] = {"anim@special_peds@casino@vince@wall@cas_vince_ig3", "cas_vince_ig3_funny_thing_is", "Sit Floor 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor13"] = {"anim@special_peds@casino@vince@wall@cas_vince_ig3", "cas_vince_ig3_hashtag_back_on_top", "Sit Floor 13", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor14"] = {"anim@special_peds@casino@vince@wall@cas_vince_ig3", "cas_vince_ig3_living_the_dream", "Sit Floor 14 ", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor"] = {"missheist_jewel", "jh_2b_endloop_male2", "Sit Floor", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying02"] = {"timetable@tracy@ig_7@base", "base", "Couch Laying 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor02"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_lookingaround_nowork", "Sit Floor 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor03"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_fallasleep_nowork", "Sit Floor 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor04"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_nowork", "Sit Floor 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor05"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping_nowork", "Sit Floor 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor06"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Sit Floor 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor07"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_wakeup_nowork", "Sit Floor 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor08"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_wakeup-noworkfemale", "Sit Floor 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor09"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown-noworkfemale", "Sit Floor 09", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor15"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_nowork", "Sit Floor 15", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor16"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping_nowork", "Sit Floor 16", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor17"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Sit Floor 17", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor18"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_wakeup_nowork", "Sit Floor 18", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor19"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_wakeup-noworkfemale", "Sit Floor 19", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor20"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown-noworkfemale", "Sit Floor 20", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor10"] = {"anim_heist@arcade_combined@", "jimmy@_smoking_idle_02", "Sit Floor 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidlem3"] = {"anim@amb@nightclub@peds@", "anim_heists_heist_safehouse_intro_phone_couch_female", "Chair Idle Male 3", AnimationOptions =
        {
            EmoteLoop = true,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["chairidlem4"] = {"anim@amb@nightclub@peds@", "anim_heists_heist_safehouse_intro_phone_couch_male", "Chair Idle Male 4", AnimationOptions =
        {
            EmoteLoop = true,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["chairsmoke"] = {"anim@amb@nightclub@smoking@", "blunt_base", "Chair Smoke", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["chairidlem2"] = {"misslester1aig_3main", "air_guitar_01_b", "Chair Idle Male 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitandwave"] = {"switch@michael@goodbye_to_jimmy", "goodbye", "Sit and wave", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidlem"] = {"switch@michael@goodbye_to_jimmy", "goodbye", "Chair Idle Male", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle"] = {"timetable@amanda@facemask@base", "base", "Chair Idle", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle02"] = {"timetable@amanda@ig_7", "idle_a", "Chair Idle 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle03"] = {"timetable@amanda@ig_7", "idle_b", "Chair Idle 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle04"] = {"timetable@amanda@ig_7", "idle_c", "Chair Idle 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle05"] = {"timetable@amanda@ig_7", "idle_d", "Chair Idle 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle06"] = {"timetable@amanda@ig_7", "idle_e", "Chair Idle 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle07"] = {"timetable@maid@couch@", "idle_b", "Chair Idle 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle08"] = {"timetable@maid@couch@", "idle_c", "Chair Idle 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle09"] = {"timetable@maid@couch@", "idle_d", "Chair Idle 09", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle10"] = {"timetable@reunited@ig_10", "shouldntyouguys_amanda", "Chair Idle 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle11"] = {"timetable@reunited@ig_10", "watching_this_amanda", "Chair Idle 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle12"] = {"timetable@reunited@ig_10", "amanda_isthisthebest", "Chair Idle 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle13"] = {"timetable@reunited@ig_10", "isthisthebest_amanda", "Chair Idle 13", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle14"] = {"timetable@reunited@ig_10", "shouldntyouguys_jimmy", "Chair Idle 14", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle15"] = {"timetable@reunited@ig_10", "jimmy_isthisthebest", "Chair Idle 15", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle16"] = {"timetable@reunited@ig_10", "watching_this_jimmy", "Chair Idle 16", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle17"] = {"timetable@reunited@ig_10", "base_jimmy", "Chair Idle 17", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chairidle18"] = {"timetable@reunited@ig_10", "isthisthebest_jimmy", "Chair Idle 18", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor10"] = {"anim@amb@casino@out_of_money@ped_male@02b@idles", "idle_b", "Sit Floor 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor11"] = {"anim@amb@casino@out_of_money@ped_male@02b@idles", "idle_c", "Sit Floor 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitfloor12"] = {"anim@amb@casino@out_of_money@ped_male@02b@idles", "idle_d", "Sit Floor 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sit"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "Sit", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sit2"] = {"rcm_barry3", "barry_3_sit_loop", "Sit 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sit3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "Sit 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sit4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "Sit 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sit5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "Sit 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sit6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "Sit 6", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sit7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "Sit 7", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sit8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "Sit 8", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sit9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "Sit 9", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitlean"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "Sit Lean", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Sit Sad", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitscared"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "Sit Scared", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitscared2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "Sit Scared 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitscared3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "Sit Scared 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitdrunk"] = {"timetable@amanda@drunk@base", "base", "Sit Drunk", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chair2"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "Sit Chair 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chair3"] = {"timetable@reunited@ig_10", "base_amanda", "Sit Chair 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chair4"] = {"timetable@ron@ig_3_couch", "base", "Sit Chair 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chair5"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "Sit Chair 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chair6"] = {"timetable@maid@couch@", "base", "Sit Chair 6", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["chair"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "Sit Chair", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying10"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig3_sleep_p1", "base_idle", "Couch Laying 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying11"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig3_sleep_p1", "idle_a", "Couch Laying 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying12"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig3_sleep_p1", "idle_b", "Couch Laying 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying13"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig3_sleep_p1", "idle_c", "Couch Laying 13", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying14"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig3_sleep_p1", "idle_d", "Couch Laying 14", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bumsleep2"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig3_sleep_p1", "idle_b", "Bum Sleep 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["injured4"] = {"misstrevor3_beatup", "guard_beatup_exit_dockworker", "Injured 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["floorlaying9"] = {"missheist_jewel", "gassed_npc_guard", "Floor Laying 9", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["floorlaying8"] = {"missheist_jewel", "gassed_npc_assistant", "Floor Laying 8", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["floorlaying7"] = {"missheist_jewel", "gassed_npc_customer4", "Floor Laying 7", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["floorlaying6"] = {"missheist_jewel", "cop_on_floor", "Floor Laying 6", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["floorlaying5"] = {"missheist_jewel", "gassed_npc_customer3", "Floor Laying 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["floorlaying4"] = {"missheist_jewel", "gassed_npc_customer1", "Floor Laying 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["floorlaying"] = {"missheist_jewel", "2b_guard_onfloor_loop", "Floor Laying", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["layingscared"] = {"misschinese2_crystalmaze", "2int_loop_base_taocheng", "Laying Scared", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["injured"] = {"random@crash_rescue@wounded@base", "base", "Injured", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["injured2"] = {"random@dealgonewrong", "idle_a", "Injured 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["injured3"] = {"rcmtmom_2leadinout", "tmom_2_leadout_loop", "Injured 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sunbathe3"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Sunbathe 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["floorlaying2"] = {"switch@trevor@dumpster", "002002_01_trvs_14_dumpster_idle", "Floor Laying 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["floorlaying3"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Floor Laying 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying"] = {"timetable@ron@ig_3_couch", "laying", "Couch Laying", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["hogtie2"] = {"random@peyote@bird", "wakeup_loop", "Hogtie 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["hogtie"] = {"random@burial", "b_burial", "Hogtie", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying03"] = {"anim@amb@nightclub@lazlow@lo_sofa@", "lowsofa_base_laz", "Couch Laying 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying04"] = {"anim@amb@nightclub@lazlow@lo_sofa@", "lowsofa_dlg_crying_laz", "Couch Laying 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying05"] = {"anim@amb@nightclub@lazlow@lo_sofa@", "lowsofa_dlg_fuckedup_laz", "Couch Laying 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying06"] = {"anim@amb@nightclub@lazlow@lo_sofa@", "lowsofa_dlg_notagain_laz", "Couch Laying 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying07"] = {"anim@amb@nightclub@lazlow@lo_sofa@", "lowsofa_dlg_ohedibles_laz", "Couch Laying 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying08"] = {"anim@amb@nightclub@lazlow@lo_sofa@", "lowsofa_dlg_paniclong_laz", "Couch Laying 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["couchlaying09"] = {"anim@amb@nightclub@lazlow@lo_sofa@", "lowsofa_dlg_shit2strong_laz", "Couch Laying 09", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["injured5"] = {"combat@damage@writheidle_c", "writhe_idle_g", "Injured 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["injured6"] = {"anim@scripted@island@special_peds@party_guy@", "fuck_you_buddy_male", "Injured 6", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["cloudgaze"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Cloudgaze", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["cloudgaze2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Cloudgaze 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sunbathe"] = {"amb@world_human_sunbathe@male@back@base", "base", "Sunbathe", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sunbathe2"] = {"amb@world_human_sunbathe@female@back@base", "base", "Sunbathe 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sunbatheback"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Sunbathe Back"},
    ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Bum Sleep"},
    ["sleep"] = {"timetable@tracy@sleep@", "idle_c", "Sleep", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["passout"] = {"missarmenian2", "drunk_loop", "Passout", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["passout2"] = {"missarmenian2", "corpse_search_exit_ped", "Passout 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["passout3"] = {"anim@gangops@morgue@table@", "body_search", "Passout 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["passout4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Passout 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["passout5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Passout 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["sitbar"] = {"anim@amb@beach_party@", "seated_cell_phone_female_a_base", "Sit bar", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["sitbar2"] = {"anim@amb@beach_party@", "seated_cell_phone_female_a_idle_a", "Sit bar 2", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["sitbar3"] = {"anim@amb@beach_party@", "seated_cell_phone_female_a_idle_b", "Sit bar 3", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["sitbar4"] = {"anim@amb@beach_party@", "seated_cell_phone_female_a_idle_c", "Sit bar 4", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["sitbar5"] = {"anim@amb@beach_party@", "seated_cell_phone_female_a_idle_d", "Sit bar 5", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
}

DP.Other = {
    ["carsexm"] = {"mini@prostitutes@sexlow_veh_first_person", "low_car_prop_loop_player", "Car sex Male", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["carsexf"] = {"mini@prostitutes@sexlow_veh_first_person", "low_car_sex_loop_female", "Car sex Female", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["carsexm2"] = {"mini@prostitutes@sexnorm_veh", "sex_loop_male", "Car sex Male 2"},
    ["carsexf2"] = {"mini@prostitutes@sexnorm_veh", "sex_loop_prostitute", "Car sex Female 2"},
    
    ["lift"] = {"random@hitch_lift", "idle_f", "Lift", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["hiking"] = {"move_m@hiking", "idle", "Hiking", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["handsup2"] = {"anim@mp_rollarcoaster", "hands_up_idle_a_player_one", "Handsup 2", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true,
        }},
    ["fuck"] = {"anim@mp_player_intupperdock", "idle_a", "Finger Fuck", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true,
        }},
    ["flipoff"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Flip Off", AnimationOptions =
        {
            EmoteMoving = true,
        }},
    ["flipoff2"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Flip Off 2", AnimationOptions =
        {
            EmoteMoving = true,
        }},
    ["finger3"] = {"anim@mp_player_intcelebrationfemale@finger", "finger", "Finger 3", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true,
        }},
    ["showboobs"] = {"mini@strip_club@backroom@", "stripper_b_backroom_idle_b", "Show Boobs", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["bjob"] = {"oddjobs@towing", "f_blow_job_loop", "BlowJob F", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bjob2"] = {"oddjobs@towing", "m_blow_job_loop", "BlowJob M", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["pimpsexf"] = {"misscarsteal2pimpsex", "pimpsex_hooker", "Pimpsex F", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["pimpsexm"] = {"misscarsteal2pimpsex", "pimpsex_punter", "Pimpsex M", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["beast"] = {"anim@mp_fm_event@intro", "beast_transform", "Beast", AnimationOptions =
        {
            EmoteDuration = 5000,
        }},
    ["prone"] = {"missfbi3_sniping", "prone_dave", "Prone", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["pullover"] = {"misscarsteal3pullover", "pull_over_right", "Pullover", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 1300,
        }},
    ["bartender"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "Bartender", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["curtsy"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Curtsy"},
    ["pointdown"] = {"gestures@f@standing@casual", "gesture_hand_down", "Point Down", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 1000
        }},
    ["surrender"] = {"random@arrests@busted", "idle_a", "Surrender", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["fallover"] = {"random@drunk_driver_1", "drunk_fall_over", "Fall Over"},
    ["fallover2"] = {"mp_suicide", "pistol", "Fall Over 2"},
    ["fallover3"] = {"mp_suicide", "pill", "Fall Over 3"},
    ["fallover4"] = {"friends@frf@ig_2", "knockout_plyr", "Fall Over 4"},
    ["fallover5"] = {"anim@gangops@hostage@", "victim_fail", "Fall Over 5"},
    ["finger"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Finger", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["finger2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Finger 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 3000
        }},
    ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 2", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 3000
        }},
    
    ["hiking"] = {"move_m@hiking", "idle", "Hiking", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug"},
    ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2"},
    ["hug3"] = {"mp_ped_interaction", "hugs_guy_a", "Hug 3"},
    ["inspect"] = {"random@train_tracks", "idle_e", "Inspect"},
    ["jazzhands"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Jazzhands", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 6000,
        }},
    ["jog2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Jog 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["jog3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Jog 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["jog4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Jog 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["jog5"] = {"move_m@joy@a", "walk", "Jog 5", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["kneel2"] = {"rcmextreme3", "idle", "Kneel 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["kneel3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "Kneel 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["knock"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "Knock", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true,
        }},
    ["knock2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "Knock 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["knucklecrunch"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Knuckle Crunch", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["me"] = {"gestures@f@standing@casual", "gesture_me_hard", "Me", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 1000
        }},
    ["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Metal", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["no"] = {"anim@heists@ornate_bank@chat_manager", "fail", "No", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["no2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "No 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["nosepick"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Nose Pick", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["outofbreath"] = {"re@construction", "out_of_breath", "Out of Breath", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["pickup"] = {"random@domestic", "pickup_low", "Pickup"},
    ["push"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Push", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["push2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Push 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["point"] = {"gestures@f@standing@casual", "gesture_point", "Point", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["pointright"] = {"mp_gun_shop_tut", "indicate_right", "Point Right", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["salute"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Salute", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["salute2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Salute 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["salute3"] = {"anim@mp_player_intuppersalute", "idle_a", "Salute 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    
    ["screwyou"] = {"misscommon@response", "screw_you", "Screw You", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["shakeoff"] = {"move_m@_idles@shake_off", "shakeoff_1", "Shake Off", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 3500,
        }},
    ["shot"] = {"random@dealgonewrong", "idle_a", "Shot", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["stumble"] = {"misscarsteal4@actor", "stumble", "Stumble", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stunned"] = {"stungun@standing", "damage", "Stunned", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["t"] = {"missfam5_yoga", "a2_pose", "T", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["t2"] = {"mp_sleep", "bind_pose_180", "T 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["warmth"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Warmth", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["whistle"] = {"taxi_hail", "hail_taxi", "Whistle", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 1300,
        }},
    ["whistle2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Whistle 2", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2000,
        }},
    
    ["lift"] = {"random@hitch_lift", "idle_f", "Lift", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["lol"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "LOL", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["lol2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "LOL 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["statue2"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Statue 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["statue3"] = {"club_intro2-0", "csb_englishdave_dual-0", "Statue 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["gangsign"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Gang Sign", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["gangsign2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Gang Sign 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["petting"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Petting", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["crawl"] = {"move_injured_ground", "front_loop", "Crawl", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["flip2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Flip 2"},
    ["flip"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Flip"},
    ["bow"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Bow", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["bow2"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Bow 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["keyfob"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Key Fob", AnimationOptions =
        {
            EmoteLoop = false,
            EmoteMoving = true,
            EmoteDuration = 1000,
        }},
    ["eat"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["reaching"] = {"move_m@intimidation@cop@unarmed", "idle", "Reaching", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000,
        }},
    ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt"},
    ["fishdance"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Fish Dance", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["peace"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Peace", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["peace2"] = {"anim@mp_player_intupperpeace", "idle_a", "Peace 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["ledge"] = {"missfbi1", "ledge_loop", "Ledge", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["airplane"] = {"missfbi1", "ledge_loop", "Air Plane", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["peek"] = {"random@paparazzi@peek", "left_peek_a", "Peek", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["cough"] = {"timetable@gardener@smoking_joint", "idle_cough", "Cough", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    
    ["punching"] = {"rcmextreme2", "loop_punching", "Punching", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["superhero"] = {"rcmbarry", "base", "Superhero", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["superhero2"] = {"rcmbarry", "base", "Superhero 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["mindcontrol"] = {"rcmbarry", "mind_control_b_loop", "Mind Control", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["mindcontrol2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Mind Control 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["clown"] = {"rcm_barry2", "clown_idle_0", "Clown", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["clown2"] = {"rcm_barry2", "clown_idle_1", "Clown 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["clown3"] = {"rcm_barry2", "clown_idle_2", "Clown 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["clown4"] = {"rcm_barry2", "clown_idle_3", "Clown 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["clown5"] = {"rcm_barry2", "clown_idle_6", "Clown 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["nervous2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Nervous 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["nervous"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Nervous", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["nervous3"] = {"rcmme_tracey1", "nervous_loop", "Nervous 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["uncuff"] = {"mp_arresting", "a_uncuff", "Uncuff", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["threaten"] = {"random@atmrobberygen", "b_atm_mugging", "Threaten", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["pull"] = {"random@mugging4", "struggle_loop_b_thief", "Pull", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["bird"] = {"random@peyote@bird", "wakeup", "Bird"},
    ["chicken"] = {"random@peyote@chicken", "wakeup", "Chicken", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["bark"] = {"random@peyote@dog", "wakeup", "Bark", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["rabbit"] = {"random@peyote@rabbit", "wakeup", "Rabbit"},
    ["spiderman"] = {"missexile3", "ex03_train_roof_idle", "Spider-Man", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["adjust"] = {"missmic4", "michael_tux_fidget", "Adjust", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 3000,
        }},
    ["handsup"] = {"missminuteman_1ig_2", "handsup_base", "Hands Up", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true,
        }},
    ["pee"] = {"misscarsteal2peeing", "peeing_loop", "Pee", AnimationOptions =
        {
            EmoteStuck = true,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_peeing",
            PtfxNoProp = true,
            PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, 1.0},
            PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
            PtfxWait = 3000,
        }},
    ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
    ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "BBQ"},
    ["bumbin"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Bum Bin"},
    ["clipboard2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Clipboard 2"},
    
    ["hammer"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Hammer"},
    ["hangout"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Hangout"},
    ["janitor"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Janitor"},
    ["jog"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Jog"},
    ["kneel"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "Kneel"},
    ["lookout"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Lookout"},
    ["maid"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Maid"},
    ["musician"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Musician"},
    ["notepad2"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Notepad 2"},
    ["parkingmeter"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Parking Meter"},
    ["party"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Party"},
    ["puddle"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Puddle"},
    ["record"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Record"},
    ["statue"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Statue"},
    ["weld"] = {"Scenario", "WORLD_HUMAN_WELDING", "Weld"},
    ["windowshop"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Window Shop"},
    ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Karate"},
    ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Karate 2"},
    ["mindblown"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Mind Blown", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 4000
        }},
    ["mindblown2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Mind Blown 2", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 4000
        }},
    ["boxing"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxing", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 4000
        }},
    ["boxing2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxing 2", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 4000
        }},
    ["adjusttie"] = {"clothingtie", "try_tie_positive_a", "Adjust Tie"},
    
    
    
    
    ["male2"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "Male 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["piggyback"] = {"anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_a", "Piggyback"},
    
    ["pageant"] = {"anim@arena@celeb@flat@solo@no_props@", "pageant_a_player_a", "Pageant"},
    ["pageant2"] = {"anim@arena@celeb@flat@solo@no_props@", "pageant_a_player_b", "Pageant 2"},
    ["golf"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Golf"},
    ["injuredcrawl"] = {"move_crawl", "onback_bwd", "Injured Crawl", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
    ["fuck"] = {"misslamar1leadinout", "denise_idle", "Fuck"},
    ["hoe2"] = {"missfra2", "lamar_base_idle", "Hoe 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["hoe"] = {"missfam4leadinoutmcs2", "tracy_loop", "Hoe", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["eavesdrop"] = {"mini@safe_cracking", "dial_turn_fail_2", "Eavesdrop", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["bow2"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Bow 2"},
    ["bow"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Bow"},
    ["rockstar3"] = {"anim@arena@celeb@podium@no_prop@", "fist_pump_a_1st", "Rockstar 5"},
    ["rockstar2"] = {"anim@arena@celeb@podium@no_prop@", "finger_guns_a_1st", "Rockstar 2"},
    ["rockstar"] = {"anim@arena@celeb@podium@no_prop@", "dance_a_1st", "Rockstar"},
    ["male"] = {"missarmenian2", "arm2_lamar_idle_01", "Male"},
    ["blowkiss3"] = {"mini@hookers_spvanilla", "idle_a", "Blow kiss 3"},
    ["blowkliss4"] = {"mini@hookers_sp", "idle_a", "Blow kiss 4"},
    ["blowkiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Blow Kiss"},
    ["blowkiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Blow Kiss 2", AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2000
        
        }},
    ["washface"] = {"missfam2_washing_face", "michael_washing_face", "Wash face", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fall11"] = {"explosions", "react_blown_left", "Fall 11"},
    ["fall10"] = {"explosions", "react_blown_forwards", "Fall 10"},
    ["fall09"] = {"explosions", "react_blown_backwards", "Fall 09"},
    ["fall08"] = {"dam_ko@shot", "ko_front_02", "Fall 08"},
    ["fall07"] = {"dam_ko@shot", "ko_shotbig_torso_f", "Fall 07"},
    ["fall06"] = {"dam_ko@shot", "ko_shotbig_torso_b", "Fall 06"},
    ["fall05"] = {"dam_ko@shot", "ko_shotbig_torso_b", "Fall 05"},
    ["fall03"] = {"dam_ko@shot", "ko_back_04", "Fall 03"},
    ["fall04"] = {"dam_ko@shot", "ko_front_01", "Fall 04"},
    ["fall"] = {"dam_ko", "ko_front", "Fall"},
    ["fall02"] = {"anim@sports@ballgame@handball@", "ball_rstop_r", "Fall 02"},
    ["fall12"] = {"misstrevor2ig_5c", "outro_die", "Fall 12"},
    ["dontleaveme"] = {"mini@triathlontrevor", "lose_race_trevor", "Dont leave me"},
    ["waitme"] = {"mini@triathlontrevor", "win_race_trevor", "Wait me"},
    ["shower"] = {"mp_safehouseshower@female@", "shower_enter_into_idle", "Shower"},
    ["shower2"] = {"mp_safehouseshower@female@", "shower_idle_a", "Shower 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["shower3"] = {"mp_safehouseshower@female@", "shower_idle_b", "Shower 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["shower4"] = {"mp_safehouseshower@male@", "male_shower_idle_a", "Shower 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["shower5"] = {"mp_safehouseshower@male@", "male_shower_idle_b", "Shower 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["shower6"] = {"mp_safehouseshower@male@", "male_shower_idle_c", "Shower 6", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["shower7"] = {"mp_safehouseshower@male@", "male_shower_idle_d", "Shower 7", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["washhand"] = {"missheist_agency3aig_23", "urinal_sink_loop", "Wash hand", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["toilet"] = {"misscarsteal4@toilet", "desperate_toilet_base_idle", "Desperate for toilet", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["getout"] = {"misscarsteal4@toilet", "desperate_toilet_idle_c", "Get out", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["jump"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_b_player_a", "Jump"},
    ["jump2"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_c_player_a", "Jump 2"},
    ["jump3"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_d_player_a", "Jump 3"},
    ["slide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Slide"},
    ["slide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Slide 2"},
    ["slide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Slide 3"},
    ["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Air Guitar"},
    ["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Air Synth"},

}

DP.Jobs = {
    ["checkout"] = {"anim@amb@carmeet@checkout_engine@", "male_a_trans_e", "Checkout", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["checkout2"] = {"anim@amb@carmeet@checkout_engine@", "male_g_idle_d", "Checkout 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["mechanicsmoke"] = {"anim@amb@carmeet@checkout_engine@", "smoke_male_a_idle_b", "Mechanic Smoke", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["mechanicsmoke2"] = {"anim@amb@carmeet@checkout_engine@", "smoke_male_a_trans_b", "Mechanic Smoke 2", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["mechanicsmoke3"] = {"anim@amb@carmeet@checkout_engine@", "smoke_male_b_idle_b", "Mechanic Smoke 3", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["mechanicsmoke4"] = {"anim@amb@carmeet@checkout_engine@", "smoke_male_b_idle_c", "Mechanic Smoke 4", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["mechanicsmoke5"] = {"anim@amb@carmeet@checkout_engine@", "smoke_male_b_idle_d", "Mechanic Smoke 5", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    
    ["mechanicdrink"] = {"anim@amb@carmeet@checkout_engine@drink@female_a@idles", "idle_b", "Mechanic Drink", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["mechanicdrink2"] = {"anim@amb@carmeet@checkout_engine@drink@male_a@idles", "idle_b", "Mechanic Drink 2", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["mechanicdrink3"] = {"anim@amb@carmeet@checkout_engine@drink@male_b@idles", "idle_a", "Mechanic Drink 3", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["mechanicdrink5"] = {"anim@amb@carmeet@checkout_engine@drink@male_b@idles", "idle_c", "Mechanic Drink 5", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["mechanicdrink4"] = {"anim@amb@carmeet@checkout_engine@drink@male_a@idles", "idle_d", "Mechanic Drink 4", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["mechanicdrink3"] = {"anim@amb@carmeet@checkout_engine@drink@male_a@idles", "idle_c", "Mechanic Drink 3", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["fixing07"] = {"mp_fm_intro_cut", "fixing_a_ped", "Fixing 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing06"] = {"misstrevor3", "bike_chat_a_2", "Fixing 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing03"] = {"misscarsteal2fixer", "confused_a", "Fixing 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing02"] = {"mini@repair", "fixing_a_ped", "Fixing 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing"] = {"mini@repair", "fixing_a_player", "Fixing", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing05"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_walkoff_mechandplayer", "Fixing 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing08"] = {"anim@amb@garage@chassis_repair@", "base_amy_skater_01", "Fixing 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing09"] = {"anim@amb@garage@chassis_repair@", "break_01_amy_skater_01", "Fixing 09", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing10"] = {"anim@amb@garage@chassis_repair@", "idle_01_amy_skater_01", "Fixing 10", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing11"] = {"anim@amb@garage@chassis_repair@", "idle_02_amy_skater_01", "Fixing 11", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing12"] = {"anim@amb@garage@chassis_repair@", "idle_03_amy_skater_01", "Fixing 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing13"] = {"anim@amb@garage@chassis_repair@", "look_around_01_amy_skater_01", "Fixing 13", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing14"] = {"anim@amb@garage@chassis_repair@", "look_around_02_amy_skater_01", "Fixing 14", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing15"] = {"anim@amb@garage@chassis_repair@", "look_around_03_amy_skater_01", "Fixing 15", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing16"] = {"anim@amb@garage@chassis_repair@", "look_tool_01_amy_skater_01", "Fixing 16", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing17"] = {"anim@amb@garage@chassis_repair@", "look_up_01_amy_skater_01", "Fixing 17", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fixing04"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Fixing 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["clipboard"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "base_idle", "Clipboard", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard02"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "beep_to_you_too", "Clipboard 02", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard03"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "bide_your_time", "Clipboard 03", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard04"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "fucking_bridge", "Clipboard 04", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard05"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "fucking_screens", "Clipboard 05", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard06"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "idle_a", "Clipboard 06", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard07"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "idle_b", "Clipboard 07", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard08"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "idle_c", "Clipboard 08", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard09"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "idle_d", "Clipboard 09", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard10"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "piece_of_shit", "Clipboard 10", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard11"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "prefer_when_it_was_tv", "Clipboard 11", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard12"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "six_degrees", "Clipboard 12", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard13"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "sure_its_nothing", "Clipboard 13", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard14"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "why_letter_so_small", "Clipboard 14", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard15"] = {"anim@scripted@submarine@special_peds@pavel@hs4_pavel_ig1_screens", "wonder_what_that_means", "Clipboard 15", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["clipboard16"] = {"anim@amb@casino@peds@", "amb_world_human_clipboard_male_idle_a", "Clipboard 16", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            EmoteLoop = true,
        }},
    ["note"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_look_right_01_inspector", "Note", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note02"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_med_lookingaround_inspector", "Note 02", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note03"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_high_lookingaround_inspector", "Note 03", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note04"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_low_idle_01_inspector", "Note 04", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note05"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_low_idle_02_inspector", "Note 05", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note06"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_med_counting_01_inspector", "Note 06", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note07"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_med_counting_02_inspector", "Note 07", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note08"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_look_right_01_inspector", "Note 08", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note09"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_low_lookingaround_inspector", "Note 09", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note10"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_med_lookingaround_inspector", "Note 10", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note11"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_high_lookingaround_inspector", "Note 11", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note12"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_low_idle_01_inspector", "Note 12", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["note13"] = {"anim@amb@business@bgen@bgen_inspecting@", "inspecting_low_idle_02_inspector", "Note 13", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -40.0, .0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 28422,
            SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["cop2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Cop 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["cop3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Cop 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["cop"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Cop"},
    ["cpr"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["cpr2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["type"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Type", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["type2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Type 2", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["type3"] = {"mp_prison_break", "hack_loop", "Type 3", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["type4"] = {"mp_fbi_heist", "loop", "Type 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["medic"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Medic"},
    ["medic2"] = {"amb@medic@standing@tendtodead@base", "base", "Medic 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["mechanic"] = {"mini@repair", "fixing_a_ped", "Mechanic", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["mechanic3"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["mechanic4"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 4", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
}

DP.Drink = {
    ["drinkf"] = {"anim@amb@carmeet@checkout_engine@", "drink_female_a_idle_a", "Drink lady", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkf2"] = {"anim@amb@carmeet@checkout_engine@", "drink_female_a_idle_d", "Drink lady 2", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkm"] = {"anim@amb@carmeet@checkout_engine@", "drink_male_a_idle_c", "Drink male", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkm2"] = {"anim@amb@carmeet@checkout_engine@", "drink_male_a_idle_d", "Drink male 2", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkm3"] = {"anim@amb@carmeet@checkout_engine@", "drink_male_a_trans_b", "Drink male 3", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkm4"] = {"anim@amb@carmeet@checkout_engine@", "drink_male_b_trans_a", "Drink male 4", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkm5"] = {"anim@amb@carmeet@checkout_engine@drink@male_a@idles", "idle_c", "Drink male 5", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkm6"] = {"anim@amb@carmeet@checkout_engine@drink@male_a@idles", "idle_d", "Drink male 6", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkm7"] = {"anim@amb@carmeet@checkout_engine@drink@male_a@idles", "idle_c", "Drink male 7", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw4"] = {"anim@amb@beach_party@", "stand_drink_cup_female_a_base", "Drink wine 4", AnimationOptions =
        {
            Prop = 'prop_drink_whtwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkwine"] = {"anim@amb@beach_party@", "stand_drink_cup_female_a_idle_a", "Drink wine", AnimationOptions =
        {
            Prop = 'prop_drink_whtwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkwine2"] = {"anim@amb@beach_party@", "stand_drink_cup_female_a_idle_b", "Drink wine 2", AnimationOptions =
        {
            Prop = 'prop_drink_whtwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinlwine3"] = {"anim@amb@beach_party@", "stand_drink_cup_female_a_idle_c", "Drink wine 3", AnimationOptions =
        {
            Prop = 'prop_drink_whtwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkwine4"] = {"anim@amb@beach_party@", "stand_drink_cup_female_a_idle_d", "Drink wine 4", AnimationOptions =
        {
            Prop = 'prop_drink_whtwine',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw"] = {"anim@amb@beach_party@", "stand_drink_cup_male_a_base", "Drink whisky", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw2"] = {"anim@amb@beach_party@", "stand_drink_cup_male_a_idle_a", "Drink whisky 02", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw3"] = {"anim@amb@beach_party@", "stand_drink_cup_male_a_idle_b", "Drink whisky 03", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw4"] = {"anim@amb@beach_party@", "stand_drink_cup_male_a_idle_c", "Drink whisky 04", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw5"] = {"anim@amb@beach_party@", "stand_drink_cup_male_a_idle_d", "Drink whisky 05", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw6"] = {"anim@amb@beach_party@", "stand_drink_cup_male_b_base", "Drink whisky 06", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw7"] = {"anim@amb@beach_party@", "stand_drink_cup_male_b_idle_a", "Drink whisky 07", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw8"] = {"anim@amb@beach_party@", "stand_drink_cup_male_b_idle_b", "Drink whisky 08", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw9"] = {"anim@amb@beach_party@", "stand_drink_cup_male_b_idle_c", "Drink whisky 09", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drinkw10"] = {"anim@amb@beach_party@", "stand_drink_cup_male_b_idle_d", "Drink whisky 10", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["drunkdance"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6", "wobbly_avoided", "Drunk dance", AnimationOptions =
        {
            EmoteLoop = true
        }},
    ["drunkdance2"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6", "idle_c", "Drunk dance 2", AnimationOptions =
        {
            EmoteLoop = true
        }},
    ["drunkdance3"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6", "somebody_check_in", "Drunk dance 3", AnimationOptions =
        {
            EmoteLoop = true
        }},
    ["drunkdance4"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6", "word_the_wise", "Drunk dance 4", AnimationOptions =
        {
            EmoteLoop = true
        }},
    ["drunkdance5"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6", "you're_back", "Drunk dance 5", AnimationOptions =
        {
            EmoteLoop = true
        }},
    ["notdrunk"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6", "were_you_gone", "Im not drunk"},
    ["looksky"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage3_ig7", "base", "Look sky"},
    ["thouchsky"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage3_ig7", "fully_projected", "I can touch a sky"},
    ["iamatone"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage3_ig7", "i_am_at_one", "Im at one"},
    ["wasted"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6", "i_lost_it", "Wasted"},
    ["wasted2"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage2_ig6", "lean_into_it", "Wasted 2"},
    ["wasted3"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage3_ig7", "i_am_herby_disembalmed", "Wasted 3"},
    ["wasted4"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage3_ig7", "idle_b", "Wasted 4"},
    ["wasted5"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage3_ig7", "idle_c", "Wasted 5"},
    ["wasted6"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage3_ig7", "idle_d", "Wasted 6"},
    ["wasted7"] = {"anim@scripted@island@special_peds@dave@hs4_dave_stage3_ig7", "one_love", "Wasted 7"},
}


DP.Phone = {
    ["textingf"] = {"anim@amb@carmeet@take_photos@", "female_a_base", "Texting lady", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingf2"] = {"anim@amb@carmeet@take_photos@", "female_b_base", "Texting lady 2", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingf3"] = {"anim@amb@carmeet@take_photos@", "female_c_base", "Texting lady 3", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingf4"] = {"anim@amb@carmeet@take_photos@", "female_d_base", "Texting lady 4", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingf5"] = {"anim@amb@carmeet@take_photos@", "female_d_trans_a", "Texting lady 5", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingf6"] = {"anim@amb@carmeet@take_photos@", "female_d_trans_b", "Texting lady 6", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingm"] = {"anim@amb@carmeet@take_photos@", "male_a_base", "Texting male", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingm2"] = {"anim@amb@carmeet@take_photos@", "male_a_idle_a", "Texting male 2", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingm3"] = {"anim@amb@carmeet@take_photos@", "male_a_idle_b", "Texting male 3", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingm4"] = {"anim@amb@carmeet@take_photos@", "male_a_trans_f", "Texting male 4", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingm5"] = {"anim@amb@carmeet@take_photos@", "male_b_base", "Texting male 5", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingm6"] = {"anim@amb@carmeet@take_photos@", "male_c_base", "Texting male 6", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingm7"] = {"anim@amb@carmeet@take_photos@", "male_f_base", "Texting male 7", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["textingm8"] = {"anim@amb@carmeet@take_photos@", "male_h_base", "Texting male 8", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["selfief"] = {"anim@amb@carmeet@take_photos@", "female_a_idle_a", "Selfie lady", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["selfief8"] = {"anim@amb@carmeet@take_photos@", "female_a_idle_c", "Selfie lady 8", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
    ["selfief2"] = {"anim@amb@carmeet@take_photos@", "female_a_trans_b", "Selfie lady 2", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["selfief3"] = {"anim@amb@carmeet@take_photos@", "female_b_idle_b", "Selfie lady 3", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["selfief4"] = {"anim@amb@carmeet@take_photos@", "female_b_idle_c", "Selfie lady 4", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["selfief5"] = {"anim@amb@carmeet@take_photos@", "female_b_idle_d", "Selfie lady 5", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["selfief6"] = {"anim@amb@carmeet@take_photos@", "female_c_idle_b", "Selfie lady 6", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["selfief7"] = {"anim@amb@carmeet@take_photos@", "female_c_trans_b", "Selfie lady 7", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["selfiem"] = {"anim@amb@carmeet@take_photos@", "male_a_trans_d", "Selfie male", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["selfiem2"] = {"anim@amb@carmeet@take_photos@", "male_b_idle_d", "Selfie male 2", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["selfiem3"] = {"anim@amb@carmeet@take_photos@", "male_b_trans_g", "Selfie male 3", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["takephot"] = {"anim@amb@carmeet@take_photos@", "female_c_idle_a", "Take photo", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["takephoto2"] = {"anim@amb@carmeet@take_photos@", "female_c_idle_c", "Take photo 2", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["takephoto3"] = {"anim@amb@carmeet@take_photos@", "female_c_trans_a", "Take photo 3", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["takephoto4"] = {"anim@amb@carmeet@take_photos@", "male_a_idle_c", "Take photo 4", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["takephoto5"] = {"anim@amb@carmeet@take_photos@", "male_a_trans_b", "Take photo 5", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["takephoto6"] = {"anim@amb@carmeet@take_photos@", "male_a_trans_c", "Take photo 6", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["takephoto7"] = {"anim@amb@carmeet@take_photos@", "male_a_trans_g", "Take photo 7", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        }},
    ["filmshocking"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Film Shocking"},
    ["texting"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Texting"},
}


DP.Club = {
    ["warmup12"] = {"missfbi3_camcrew", "base_gal", "Warm up 12", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["yoga4"] = {"misscarsteal1leadin", "devon_idle_02", "Yoga 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup05"] = {"mini@triathlon", "ig_2_gen_warmup_06", "Warm up 05", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup06"] = {"mini@triathlon", "idle_b", "Warm up 06", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup07"] = {"mini@triathlon", "ig_2_gen_warmup_02", "Warm up 07", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup08"] = {"mini@triathlon", "idle_a", "Warm up 08", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup"] = {"mini@triathlon", "idle_d", "Warm Up", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup04"] = {"mini@triathlon", "ig_2_gen_warmup_01", "Warm up 04", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup02"] = {"mini@triathlon", "idle_e", "Warm Up 02", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup03"] = {"mini@triathlon", "ig_2_gen_warmup_04", "Warm up 03", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["yoga2"] = {"random@peyote@cat", "wakeup", "Yoga 2"},
    ["stretchlong"] = {"switch@franklin@bed", "stretch_long", "Stretch long"},
    ["stretchshort"] = {"switch@franklin@bed", "stretch_short", "Stretch short"},
    ["yoga3"] = {"switch@trevor@rand_temple", "tai_chi_trevor", "Yoga 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stretch5"] = {"timetable@denice@ig_1", "idle_a", "Stretch 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stretch4"] = {"timetable@denice@ig_1", "idle_b", "Stretch 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stretch6"] = {"timetable@denice@ig_1", "idle_c", "Stretch 6", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup10"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_d", "Warm up 10"},
    ["warmup11"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Warm up 11"},
    ["fightme3"] = {"misschinese1leadinoutchinese_1_int", "russ_leadin_loop", "Fight me 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fightme4"] = {"misschinese1leadinoutchinese_1_int", "husb_leadin_loop", "Fight me 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fightme5"] = {"misschinese1leadinoutchinese_1_int", "russ_leadin_loop", "Fight me 5", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fightme6"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_d", "Fight me 6", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["warmup09"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_b", "Warm up 09"},
    ["chinup"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Chinup", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fightme"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Fight Me", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["fightme2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Fight Me 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["flex"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Flex"},
    ["jumpingjacks"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Jumping Jacks", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["situp"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Sit Up", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["pushup"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Pushup", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga"},
    ["stretch"] = {"mini@triathlon", "idle_e", "Stretch", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stretch2"] = {"mini@triathlon", "idle_f", "Stretch 2", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stretch3"] = {"mini@triathlon", "idle_d", "Stretch 3", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["stretch4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "Stretch 4", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    ["meditate"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Meditiate", AnimationOptions = -- CHANGE ME
        {
            EmoteLoop = true,
        }},
    ["meditate2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Meditiate 2", AnimationOptions = -- CHANGE ME
        {
            EmoteLoop = true,
        }},
    ["meditate3"] = {"rcmepsilonism3", "base_loop", "Meditiate 3", AnimationOptions = -- CHANGE ME
        {
            EmoteLoop = true,
        }},
}




DP.PropEmotes = {
    ["megaphone"] = {"amb@world_human_paparazzi@male@base", "base", "Megaphone", AnimationOptions =
        {
            Prop = 'prop_megaphone_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 15.0, -70.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
        {
            Prop = 'prop_megaphone_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["umbrella"] = {"amb@world_human_drinking@coffee@male@base", "base", "Umbrella", AnimationOptions =
        {
            Prop = "p_amb_brolly_01",
            PropBone = 57005,
            PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    
    -----------------------------------------------------------------------------------------------------
    ------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
    -----------------------------------------------------------------------------------------------------
    ["ecola"] = {"mp_player_intdrink", "loop_bottle", "e-cola", AnimationOptions =
        {Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
            EmoteMoving = true, EmoteLoop = true, }},
    ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "sprunk", AnimationOptions =
        {Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
            EmoteMoving = true, EmoteLoop = true, }},
    ["pizza"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Pizza", AnimationOptions =
        {Prop = "v_res_tt_pizzaplate", PropBone = 18905, PropPlacement = {0.20, 0.038, 0.051, 15.0, 155.0},
            EmoteMoving = true, EmoteLoop = true, }},
    ["bowl"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "bowl", AnimationOptions =
        {Prop = "h4_prop_h4_coke_plasticbowl_01", PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true, EmoteLoop = true, }},
    ["pineapple"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Pizza", AnimationOptions =
        {Prop = "prop_pineapple", PropBone = 18905, PropPlacement = {0.10, 0.038, 0.03, 15.0, 50.0},
            EmoteMoving = true, EmoteLoop = true, }},
    ["foodbowl"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "bowl", AnimationOptions =
        {Prop = "prop_cs_bowl_01", PropBone = 28422, PropPlacement = {0.0, 0.0, 0.050, 0.0, 0.0, 0.0},
            EmoteMoving = true, EmoteLoop = true, }},
        --Jim-CatCafe
    ["uwu1"] = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
    {    Prop = 'uwu_sml_drink', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true, EmoteMoving = true, }},
    ["uwu2"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
    {    Prop = 'uwu_pastry', PropBone = 18905, PropPlacement = {0.15, 0.06, -0.02, -50.0, 16.0, 60.0},
        EmoteMoving = true, }},
    ["uwu3"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
    {    Prop = 'uwu_sushi', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
        EmoteMoving = true, }},
    ["uwu4"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "", AnimationOptions =
    {    Prop = 'uwu_eggroll', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 50.0, 0.0},
        EmoteMoving = true, }},
    ["uwu5"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "", AnimationOptions =
    {    Prop = "uwu_salad_bowl", PropBone = 60309, PropPlacement = {-0.015, 0.03, 0.01, 0.0, 0.0, 0.0},
        SecondProp = 'uwu_salad_spoon', SecondPropBone = 28422, SecondPropPlacement = {0.0, 0.0 ,0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true, EmoteMoving = true, }},
    ["uwu6"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Iced Latte", AnimationOptions =
    {    Prop = 'uwu_cup_straw',PropBone = 28422,PropPlacement = {0.0, 0.0, -0.03, 0.0, 0.0, 270.0},
        EmoteLoop = true,EmoteMoving = true,}},
    ["uwu7"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
    {    Prop = 'apa_prop_cs_plastic_cup_01',PropBone = 28422,PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 90.0},
        EmoteLoop = true, EmoteMoving = true, }},
    ["uwu8"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
    {    Prop = 'uwu_miso', PropBone = 28422, PropPlacement = {0.025, 0.0, -0.02, 0.0, 10.0, 0.0},
        EmoteLoop = true, EmoteMoving = true, }},
    ["uwu9"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "", AnimationOptions =
    {    Prop = "prop_cs_bowl_01b", PropBone = 60309, PropPlacement = {0.0, 0.03, 0.01, 0.0, 0.0, 0.0}, SecondProp = 'uwu_salad_spoon',
        SecondPropBone = 28422,    SecondPropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
        EmoteLoop = true, EmoteMoving = true, }},
    ["uwu10"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
    {    Prop = 'uwu_lrg_drink', PropBone = 28422, PropPlacement = {0.02, 0.0, -0.06, 0.0, 0.0, 90.0},
        EmoteLoop = true, EmoteMoving = true, }},        
    ["uwu11"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
    {    Prop = 'uwu_mug', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
        EmoteLoop = true, EmoteMoving = true, }}, 
    ["uwu12"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
    {    Prop = 'uwu_cookie', PropBone = 18905, PropPlacement = {0.16, 0.08, -0.01, -225.0, 20.0, 60.0},
        EmoteMoving = true, }},
    ["notepad"] = {"missheistdockssetup1clipboard@base", "base", "Notepad", AnimationOptions =
        {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 58866,
            SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
            -- EmoteLoop is used for emotes that should loop, its as simple as that.
            -- Then EmoteMoving is used for emotes that should only play on the upperbody.
            -- The code then checks both values and sets the MovementType to the correct one
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["box"] = {"anim@heists@box_carry@", "idle", "Box", AnimationOptions =
        {
            Prop = "hei_prop_heist_box",
            PropBone = 60309,
            PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["rose"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Rose", AnimationOptions =
        {
            Prop = "prop_single_rose",
            PropBone = 18905,
            PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["smoke2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke 2", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["smoke3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke 3", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["smoke4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Smoke 4", AnimationOptions =
        {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["bong"] = {"anim@safehouse@bong", "bong_stage3", "Bong", AnimationOptions =
        {
            Prop = 'hei_heist_sh_bong_01',
            PropBone = 18905,
            PropPlacement = {0.10, -0.25, 0.0, 95.0, 190.0, 180.0},
        }},
    ["suitcase"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase", AnimationOptions =
        {
            Prop = "prop_ld_suitcase_01",
            PropBone = 57005,
            PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["suitcase2"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase 2", AnimationOptions =
        {
            Prop = "prop_security_case_01",
            PropBone = 57005,
            PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["mugshot"] = {"mp_character_creation@customise@male_a", "loop", "Mugshot", AnimationOptions =
        {
            Prop = 'prop_police_id_board',
            PropBone = 58868,
            PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions =
        {
            Prop = 'p_amb_coffeecup_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["coffee2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey", AnimationOptions =
        {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Beer", AnimationOptions =
        {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cup", AnimationOptions =
        {
            Prop = 'prop_plastic_cup_02',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
        {
            Prop = 'prop_amb_donut',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true,
        }},
    ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
        {
            Prop = 'prop_cs_burger_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true,
        }},
    ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
        {
            Prop = 'prop_sandwich_01',
            PropBone = 18905,
            PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true,
        }},
    ["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Soda", AnimationOptions =
        {
            Prop = 'prop_ecola_can',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Ego Bar", AnimationOptions =
        {
            Prop = 'prop_choc_ego',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
        }},
    ["wine"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Wine", AnimationOptions =
        {
            Prop = 'prop_drink_redwine',
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["flute"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute", AnimationOptions =
        {
            Prop = 'prop_champ_flute',
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["champagne"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Champagne", AnimationOptions =
        {
            Prop = 'prop_drink_champ',
            PropBone = 18905,
            PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["cigar"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar", AnimationOptions =
        {
            Prop = 'prop_cigar_02',
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }},
    ["cigar2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar 2", AnimationOptions =
        {
            Prop = 'prop_cigar_01',
            PropBone = 47419,
            PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }},
    ["guitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar", AnimationOptions =
        {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["guitar2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Guitar 2", AnimationOptions =
        {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["guitarelectric"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric", AnimationOptions =
        {
            Prop = 'prop_el_guitar_01',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["guitarelectric2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric 2", AnimationOptions =
        {
            Prop = 'prop_el_guitar_03',
            PropBone = 24818,
            PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["book"] = {"cellphone@", "cellphone_text_read_base", "Book", AnimationOptions =
        {
            Prop = 'prop_novel_01',
            PropBone = 6286,
            PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["bouquet"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bouquet", AnimationOptions =
        {
            Prop = 'prop_snow_flower_02',
            PropBone = 24817,
            PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["teddy"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Teddy", AnimationOptions =
        {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 24817,
            PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["backpack"] = {"move_p_m_zero_rucksack", "idle", "Backpack", AnimationOptions =
        {
            Prop = 'p_michael_backpack_s',
            PropBone = 24818,
            PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["clipboard"] = {"missfam4", "base", "Clipboard", AnimationOptions =
        {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["map"] = {"amb@world_human_tourist_map@male@base", "base", "Map", AnimationOptions =
        {
            Prop = 'prop_tourist_map_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true
        }},
    ["beg"] = {"amb@world_human_bum_freeway@male@base", "base", "Beg", AnimationOptions =
        {
            Prop = 'prop_beggers_sign_03',
            PropBone = 58868,
            PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["makeitrain"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Make It Rain", AnimationOptions =
        {
            Prop = 'prop_anim_cash_pile_01',
            PropBone = 60309,
            PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_xs_celebration",
            PtfxName = "scr_xs_money_rain",
            PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, 1.0},
            PtfxInfo = Config.Languages[Config.MenuLanguage]['makeitrain'],
            PtfxWait = 500,
        }},
    ["camera"] = {"amb@world_human_paparazzi@male@base", "base", "Camera", AnimationOptions =
        {
            Prop = 'prop_pap_camera_01',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = "scr_bike_business",
            PtfxName = "scr_bike_cfid_camera_flash",
            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }},
    ["champagnespray"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Champagne Spray", AnimationOptions =
        {
            Prop = 'ba_prop_battle_champ_open',
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_ba_club",
            PtfxName = "scr_ba_club_champagne_spray",
            PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            PtfxInfo = Config.Languages[Config.MenuLanguage]['spraychamp'],
            PtfxWait = 500,
        }},
    ["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint", AnimationOptions =
        {
            Prop = 'p_cs_joint_02',
            PropBone = 47419,
            PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }},
    ["cig"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cig", AnimationOptions =
        {
            Prop = 'prop_amb_ciggy_01',
            PropBone = 47419,
            PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
            EmoteMoving = true,
            EmoteDuration = 2600
        }},
    ["brief3"] = {"missheistdocksprep1hold_cellphone", "static", "Brief 3", AnimationOptions =
        {
            Prop = "prop_ld_case_01",
            PropBone = 57005,
            PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["tablet"] = {"amb@world_human_tourist_map@male@base", "base", "Tablet", AnimationOptions =
        {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["tablet2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Tablet 2", AnimationOptions =
        {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["phonecall"] = {"cellphone@", "cellphone_call_listen_base", "Phone Call", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["phone"] = {"cellphone@", "cellphone_text_read_base", "Phone", AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["clean"] = {"timetable@floyd@clean_kitchen@base", "base", "Clean", AnimationOptions =
        {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["clean2"] = {"amb@world_human_maid_clean@", "base", "Clean 2", AnimationOptions =
        {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
            EmoteLoop = true,
            EmoteMoving = true,
        }},
    ["shover"] = {"missmic1leadinoutmic_1_mcs_2", "_leadin_trevor", "Shover", AnimationOptions =
        {
            Prop = 'prop_tool_shovel006',
            PropBone = 28422,
            PropPlacement = {0.0, -0.05, -1.2, 0.0, 0.0, 0.0},
            EmoteLoop = true,
        }},
}
