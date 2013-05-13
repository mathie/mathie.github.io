---
layout: post
status: publish
published: true
title: Using ssh-agent and screen together
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2005-08-17 11:11:35.000000000 +01:00
categories:
- Geekery
tags: []
comments:
- id: 41
  author: Guru
  author_email: sgprasad@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNS0xMS0wOCAwODoxNzo0NyArMDAwMA==
  date_gmt: !binary |-
    MjAwNS0xMS0wOCAwNzoxNzo0NyArMDAwMA==
  content: ! "Hi,\n\nWe have a problem with ssh-agent and ssh-add.\n\nWe have our
    program which starts the ssh-agent and stores its\nenvironment variables in a
    hash dictionary. Another function in the\nsame program would read these environment
    variables, set the same\n(using putenv()), start a pty and then add the key to
    the agent using\nssh-add (pty is started in order to give the passphrase as the
    input).\n\nBut, while executing ssh-add, we are getting the error \"Could not
    open\na connection to your authentication agent.\". We have ensured that\nenvironment
    variables are set by executing getenv().\n\nWithin a process, we are starting
    the agent like this,\ncode snippet:\n\nfp = popen(\"ssh-agent -s\",\"r\");\n     while(fgets(temp_buff,100,fp)
    !=NULL)\n     {\n        if(line_count ==2){\n        break;}\n         line_count++;\n\n\n
    \       char *buff;\n        buff= new char[100];\n        bzero(buff,100);\n\n\n
    \       int i =0, buff_len =0, rc1;\n        for(int j=0;jagentEnvs-&gt;env1 =
    new char[buff_len+1];\n               strncpy(env_value-&gt;agentEnvs-&gt;env1,buff,buff_len);\n
    \              env_value-&gt;agentEnvs-&gt;env1[buff_len] = '';\n               env_value-&gt;len1
    = buff_len+1;\n               rc1= putenv(env_value-&gt;agentEnvs-&gt;env1);  //Here
    !!\n               bzero(buff,100);\n               break; //Out of the for loop\n
    \            }\n            else if(line_count == 2)\n             {\n               env_value-&gt;agentEnvs-&gt;env2
    = new char[buff_len+1];\n               strncpy(env_value-&gt;agentEnvs-&gt;env2,buff,buff_len);\n
    \              env_value-&gt;agentEnvs-&gt;env2[buff_len] = '';\n               env_value-&gt;len2
    = buff_len+1;\n               rc1= putenv(env_value-&gt;agentEnvs-&gt;env2);  //Here
    !!\n               bzero(buff,100);\n               break; //Out of the for loop\n
    \            }\n           }\n          buff[i++] = temp_buff[j];\n        }\n
    \    }\n     pclose(fp);\n    system(\"ssh-add -l\"); //testing purpose\n\n\nBoth
    ssh-agent and ssh-add are run by the same user.\n\n\nWhile we start the agent,
    we are capturing the ssh-agent environment\nvariables (SSH_AUTH_SOCK and SSH_AGENT_PID)
    and storing it.\ni.e., the cmd \"ssh-agent -s\" would result in an output like
    this,\n     SSH_AUTH_SOCK=/tmp/ssh-QDL22304/agent.22304; export SSH_AUTH_SOCK;\n
    \    SSH_AGENT_PID=22306; export SSH_AGENT_PID;\n     echo Agent pid 22306;\nHere,
    we are cutting the first env SSH_AUTH_SOCK until we find the\ndelimiter \";\"
    and then we are appending a null character \"\" for the\ncut string. Similarly,
    two env variables are extracted and stored.\nWell, then this string is given as
    input for putenv().\n\nIt would be very helpful and greatly appreciated if you
    can help us\nin solving this problem.\n\n\nThanks\nGuru\nsgprasad@gmail.com"
- id: 42
  author: Rick Cox
  author_email: rick.cox@gmail.com
  author_url: ''
  date: !binary |-
    MjAwNi0wMS0xMiAyMDo0MDoxOSArMDAwMA==
  date_gmt: !binary |-
    MjAwNi0wMS0xMiAxOTo0MDoxOSArMDAwMA==
  content: ! "Thanks! This is the most elegant solution I've found yet. I've slightly
    modified it so that I can ssh into another host (with the same bashrc) and then
    ssh from that host onwards; the terminal type of the remote shell will be 'screen',
    but it won't have access to the ${screen_ssh_agent} socket. So I just avoid changing
    the socket if the permanent one doesn't exist.\n\n----------------\n# slightly
    modified from http://woss.name/2005/08/17/using-ssh-agent-and-screen-together/\nif
    [ -n \"$SSH_AUTH_SOCK\" ]; then\n        user=`whoami`\n        screen_ssh_agent=\"/tmp/${user}-screen-ssh-agent.sock\"\n
    \       if [ \"$TERM\" = \"screen\" ]; then\n                # shell in a screen.
    If we're on the host with the permanent name\n                # for the ssh agent,
    use that instead. if this shell is\n                # in an ssh to a different
    host (which happens to be in a screen),\n                # though, we'll keep
    the variable name (which will be\n                # persistent as long as that
    ssh remains up, exactly what we want).\n                if [ -e ${screen_ssh_agent}
    ]; then\n                        export SSH_AUTH_SOCK=${screen_ssh_agent}\n                fi\n
    \       else\n                ln -snf ${SSH_AUTH_SOCK} ${screen_ssh_agent}\n        fi\nfi\n----------------"
- id: 43
  author: zim
  author_email: fireant_zim@yahoo.com
  author_url: ''
  date: !binary |-
    MjAwNi0wOC0wOCAyMzo1ODozMyArMDEwMA==
  date_gmt: !binary |-
    MjAwNi0wOC0wOCAyMjo1ODozMyArMDEwMA==
  content: ! "<p>Great solution but using STY is more reliable then matching against
    the TERM env.</p>\n\n<p>if [ -n \"$SSH_AUTH_SOCK\" ]; then\n    screen_ssh_agent=\"/tmp/${USER}-screen-ssh-agent.sock\"\n
    \   if [ ${STY} ]; then\n        if [ -e ${screen_ssh_agent} ]; then\n            export
    SSH_AUTH_SOCK=${screen_ssh_agent}\n        fi\n    else\n        ln -snf ${SSH_AUTH_SOCK}
    ${screen_ssh_agent}\n    fi\nfi</p>"
---
I've been meaning to 'fix' this for ages.  I use public-key authentication for my <a href="http://www.openssh.com/">ssh</a> connections wherever possible.  I also use <a href="http://www.gnu.org/software/screen/" title="GNU Screen">screen</a> all the time.  (If you use ssh regularly and haven't discovered it already, go look now!  There's a bit of a learning curve, but it's well worth it!)  But the <code>SSH_AUTH_SOCK</code> isn't always set correctly inside a screen session, so you can't then use the ssh key on the client computer to authenticate against other hosts.  (Oh, I also have a reasonably strict policy of only ever create SSH keys for hosts that I am actually, physically, at the console of, not for hosts I merely ssh into now and then.  There are, of course, exceptions to this rule!)

Let's describe the problem a little more clearly.  I have two Macs, <code>tandoori</code> and <code>dream</code>.  <code>Tandoori</code> is my work laptop, <code>dream</code> is my iMac at home.  And my web hosting company allows shell access with ssh to <code>woss.name</code>.  First thing in the morning, I'm logging in from dream to check some logs, then detaching from the session.  The screen session is a new one, since the shell server got rebooted in the night.  Here is the session, (minus what I actually did!):

[code]mathie@Tandoori:mathie$ ssh -A -t woss.name screen -xRR
[ ... my shell starts up inside screen ... ]
mathie@napoleon:mathie$ echo $SSH_AUTH_SOCK
/tmp/ssh-XXjqTtiY/agent.25944
mathie@napoleon:mathie$ ssh-add -l
1024 f8:c2:ae:f9:5c:8f:28:67:ba:fb:c6:d8:60:2f:f5:52 /Users/mathie/.ssh/id_dsa (DSA)
mathie@napoleon:mathie$
[detached]
Connection to napoleon.dreamhost.com closed.
mathie@Tandoori:mathie$[/code]

As you can see, it is happily talking to my ssh agent on my iMac and using the identity stored there.  Now, later on I login from <code>tandoori</code> to check something else:

[code]mathie@Tandoori:mathie$ ssh -A -t woss.name screen -xRR
[ ... my shell starts up inside screen ... ]
mathie@napoleon:mathie$ echo $SSH_AUTH_SOCK
/tmp/ssh-XXjqTtiY/agent.25944
mathie@napoleon:mathie$ ssh-add -l
Could not open a connection to your authentication agent.
mathie@napoleon:mathie$
[detached]
Connection to napoleon.dreamhost.com closed.
mathie@Tandoori:mathie$[/code]

Why couldn't it connect this time?  Well, because the environment variable <code>SSH_AUTH_SOCK</code>, which it inherited from the environment when screen was first started, points to the <em>old</em> agent socket from the first session of the morning, not the current socket.

So, what to do about it?  Well, here's my solution, from my ~/.bashrc:

[code]if [ -z ! "$SSH_AUTH_SOCK" ]; then
    screen_ssh_agent=${HOME}/usr/state/ssh-agent-screen
    if [ "$TERM" = "screen" ]; then
        SSH_AUTH_SOCK=${screen_ssh_agent}; export SSH_AUTH_SOCK
    else
        ln -snf ${SSH_AUTH_SOCK} ${screen_ssh_agent}
    fi[/code]

So, if the current terminal is inside a screen session, it will use a fixed, known path to an agent socket.  And if the current terminal is <em>not</em> a screen session (say the login shell that precedes reconnecting to screen!), it will update the symlink.  (Of course, my ~/.bashrc is a little more complicated than that -- you can see the ssh-related stuff in <a href="http://woss.name/svn/mathie/homedir/trunk/usr/etc/profile.d/ssh.sh">usr/etc/profile.d/ssh.sh</a>.  Or at least you would be able to if websvn wasn't a pile of poo.)

There is one failure scenario I can think of.  Say you have two terminal windows open on your desktop, with one connected to the screen session on <code>woss.name</code>  But then you want another view onto the current screen session, so ssh in from the other terminal window.  Then you log out from the second window.  Since logging in from the second window had the effect of updating the symlink to point to its agent, the first no longer has a valid connection to its agent.  But it's a rare enough case that I am not too worried about it.
