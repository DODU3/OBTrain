var dobot = {
    jsApi:null,
    socket:null,
    showLine: 0,
    port:12345,
    backend:null,
    init:function(){
        this.initSocket();
    },
    initSocket: function(){
        var $this = this;
        var baseUrl = "ws://localhost:12345";
        if (location.search != ""){
            var regPort  = /[?&]port=([0-9]+)/.exec(location.search);
            if(regPort){
                var baseUrl = "ws://localhost:" + regPort[1];
                $this.port = regPort[1];
            }
        }

        //this.output("Start dobot blockly at " + baseUrl + ".");
        this.socket = new WebSocket(baseUrl);

        this.socket.onclose = function()
        {
            $this.output("web channel closed");
        };
        this.socket.onerror = function(error)
        {
            $this.output("web channel error: " + error);
        };
        this.socket.onopen = function()
        {
            //$this.output("Dobot blockly initialize already, going to prepare param.");
            new QWebChannel(dobot.socket, function(channel) {
                // make dialog object accessible globally
                $this.jsApi = channel.objects.jsApi;
                $this.initJsApi();
                $this.output("OBDrone prepare already, can to edit!\n");
                $this.jsApi.setCanStartWork();
                setInterval(function(){
                    $this.generalCode()
                },300);
            });
        }
    },
    initJsApi:function(){
        var $this = this;
        
        this.jsApi.onStart.connect(function() {
            var code = Blockly.Python.workspaceToCode(Code.workspace);
            if (!code) {
                output("Cannot start when the blockly is not exist!\n");
                return;
            }
            $this.jsApi.runBlockly(code);
        });
        
        this.jsApi.onSave.connect(function(name) {
            var xml = Blockly.Xml.workspaceToDom(Code.workspace);
            var txt = Blockly.Xml.domToText(xml);
            $this.jsApi.saveBlockly(name, txt);
        });
        
        this.jsApi.onOpen.connect(function(str) {
            var workspace = Code.opt_workspace || Blockly.getMainWorkspace();
            var xml = Blockly.Xml.textToDom(str);
            Code.workspace.clear();
            if (window.location.hash) {
                window.location.hash = '';
            }
            Code.renderContent();
            Blockly.Xml.domToWorkspace(xml, workspace);
            Code.updateFromHWVersion();
        });
        
        this.jsApi.onClear.connect(function() {
            Code.workspace.clear();
            if (window.location.hash) {
                window.location.hash = '';
            }
            Code.renderContent();
        });
        
        this.jsApi.onSetLang.connect(function(lang) {
            var languageMenu = document.getElementById('languageMenu');
            languageMenu.value = lang;
            languageMenu.dispatchEvent(new Event("change"));
        });
        
        this.jsApi.onBackup.connect(function(lang) {
            var workspace = Code.opt_workspace || Blockly.getMainWorkspace();
            BlocklyStorage.backupBlocks_(workspace);
        });

        this.jsApi.onUpdateHWVersion.connect(function(hwVersion) {
            window.hwVersion = hwVersion;
            Code.updateFromHWVersion();
        });
    },
    loadUrl:function(url){
        this.jsApi.loadUrl(url);
    },
    generalCode:function(){
        var code = Blockly.Python.workspaceToCode(Code.workspace);
        //if (!code) {
        //    return;
        //}
        this.jsApi.generalCode(code);
    },
    output:function(message){
        if(this.jsApi != null)
            this.jsApi.generalLog(message);
        else{
            alert(message);
        }
    }
}
window.dobot = dobot;
window.onload = function() {
    dobot.init()
}
window.hwVersion = "0.0.0"
