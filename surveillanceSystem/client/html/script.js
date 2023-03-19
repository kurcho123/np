

const CameraApp = new Vue({
    el: "#camcontainer",

    data: {
        camerasOpen: false,
        cameraLabel: ":)",
        connectLabel: "CONNECTED",
        ipLabel: "IP: 192.168.0.1",
        dateLabel: "04/09/1999",
        recordingLabel: "🔴 REC",
        accountLabel: "user: administrator",
    },

    methods: {
        OpenCameras(label, connected, cameraId, time) {
            var today = new Date();
            var date = today.getDate()+'/'+(today.getMonth()+1)+'/'+today.getFullYear() + " " + time;
            var recording = "🔴 REC";
			var user = "user: administrator";

            this.camerasOpen = true;
            this.ipLabel = "IP: 192.168." + cameraId * 2 + "."+cameraId;
            if (connected) {
                this.cameraLabel = label;
                this.connectLabel = "CONNECTED";
                this.dateLabel = date;
                this.recordingLabel = recording;
				this.accountLabel = user;
				
                $("#connectedlabel").removeClass("disconnect");
                $("#connectedlabel").addClass("connect");
            } else {
                this.cameraLabel = "ERROR CODE: #400 - BAD REQUEST"
                this.connectLabel = "CONNECTION FAILED";
                this.dateLabel = "ERROR";
                this.recordingLabel = "ERROR";
				this.accountLabel = "NO USER";

                $("#connectedlabel").removeClass("connect");
                $("#connectedlabel").addClass("disconnect");
            }
            
        },

        CloseCameras() {
            this.camerasOpen = false;
        },

        UpdateCameraLabel(label) {
            this.cameraLabel = label;
        },

        UpdateCameraTime(time) {
            var recording = "00:" + time
            this.recordingLabel = recording;
        },
    }
});

document.onreadystatechange = () => {
    if (document.readyState === "complete") {
        window.addEventListener('message', function(event) {

            if (event.data.type == "enablecam") {
                CameraApp.OpenCameras(event.data.label, event.data.connected, event.data.id, event.data.time);
            } else if (event.data.type == "disablecam") {
                CameraApp.CloseCameras();
            } else if (event.data.type == "updatecam") {
                CameraApp.UpdateCameraLabel(event.data.label);
            } else if (event.data.type == "updatecamtime") {
                CameraApp.UpdateCameraTime(event.data.time);
			}
        });
    };
};
