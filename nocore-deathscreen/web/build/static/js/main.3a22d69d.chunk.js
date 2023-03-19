(this.webpackJsonpweb = this.webpackJsonpweb || []).push([
    [0],
    {
        18: function (e, t, c) {},
        19: function (e, t, c) {},
        28: function (e, t, c) {
            "use strict";
            c.r(t);
            var n = c(0),
                s = c(12),
                i = c.n(s),
                r = (c(18), c(4)),
                a = (c(19), function () {}),
                o = function (e, t) {
                    var c = Object(n.useRef)(a);
                    Object(n.useEffect)(
                        function () {
                            c.current = t;
                        },
                        [t]
                    ),
                        Object(n.useEffect)(
                            function () {
                                var t = function (t) {
                                    var n = t.data,
                                        s = n.action,
                                        i = n.data;
                                    c.current && s === e && c.current(i);
                                };
                                return (
                                    window.addEventListener("message", t),
                                    function () {
                                        return window.removeEventListener("message", t);
                                    }
                                );
                            },
                            [e]
                        );
                },
                d = (c(20), c(35)),
                j = c(1),
                u = function () {
                    var e = Object(n.useState)(0),
                        t = Object(r.a)(e, 2),
                        c = t[0],
                        s = t[1],
                        i = Object(n.useState)(40),
                        a = Object(r.a)(i, 2),
                        u = a[0],
                        l = a[1],
                        b = Object(n.useState)(190),
                        O = Object(r.a)(b, 2),
                        x = O[0],
                        v = O[1];
                    o("setVisible", function (e) {
                        s(e);
                    }),
                        o("updateTimer", function (e) {
                            v(e), l(Math.round(100 - (e / 300) * 100));
                        });
                    var h = function () {
                        return x <= 100
                            ? Object(j.jsx)("span", { style: { color: "#3DD04B" }, children: x })
                            : x <= 200
                            ? Object(j.jsx)("span", { style: { color: "#D09E3D" }, children: x })
                            : x <= 300
                            ? Object(j.jsx)("span", { style: { color: "#D03D3D" }, children: x })
                            : Object(j.jsx)("div", {});
                    };
                    return Object(j.jsxs)("div", {
                        className: "nui-wrapper",
                        children: [
                            Object(j.jsxs)("div", {
                                className: "first-ui",
                                style: { display: 1 == c ? "" : "none" },
                                children: [
                                    Object(j.jsxs)("div", { className: "downText", children: ["You are currently ", Object(j.jsx)("span", { style: { color: "#9441e1" }, children: " incapacitated" })] }),
                                    Object(j.jsxs)("div", { className: "timeText", children: [" ", Object(j.jsx)(h, {}), " seconds remaining"] }),
                                    Object(j.jsx)(d.a, { variant: "determinate", value: u, sx: { width: 500, color: "#9B9B9B", marginTop: 1.3, borderRadius: 5, backgroundColor: "#9B9B9B" } }),
                                    Object(j.jsx)("div", { className: "hintText", children: "Hint: You can use /me actions to describe your injuries to EMS" }),
                                ],
                            }),
                            Object(j.jsxs)("div", {
                                className: "second-ui",
                                style: { display: 2 == c ? "" : "none" },
                                children: [
                                    Object(j.jsxs)("div", { className: "downText", children: ["You are currently ", Object(j.jsx)("span", { style: { color: "#9441e1" }, children: " incapacitated" })] }),
                                    Object(j.jsxs)("div", { className: "timeText", children: ["Hold ", Object(j.jsx)("span", { style: { color: "#9441e1" }, children: "E" }), " (5s) to revive(2000$), or wait for EMS!"] }),
                                    Object(j.jsx)("div", { className: "hintText-2", children: "Hint: You can use /me actions to describe your injuries to EMS" }),
                                ],
                            }),
                        ],
                    });
                };
            i.a.render(Object(j.jsx)(u, {}), document.getElementById("root"));
        },
    },
    [[28, 1, 2]],
]);
//# sourceMappingURL=main.3a22d69d.chunk.js.map
