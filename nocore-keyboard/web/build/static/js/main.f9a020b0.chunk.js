(this.webpackJsonpweb=this.webpackJsonpweb||[]).push([[0],{44:function(e,t,n){},77:function(e,t,n){},85:function(e,t,n){"use strict";n.r(t);var c=n(0),r=n.n(c),a=n(25),i=n.n(a),o=(n(77),n(13)),s=(n(44),function(){}),u=n(50),d=n.n(u),j=n(57);function l(e,t){return f.apply(this,arguments)}function f(){return(f=Object(j.a)(d.a.mark((function e(t,n){var c,r,a,i;return d.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return c={method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(n)},r=window.GetParentResourceName?window.GetParentResourceName():"nui-frame-app",e.next=4,fetch("https://".concat(r,"/").concat(t),c);case 4:return a=e.sent,e.next=7,a.json();case 7:return i=e.sent,e.abrupt("return",i);case 9:case"end":return e.stop()}}),e)})))).apply(this,arguments)}var h=n(129),b=n(133),p=n(137),O=n(136),x=n(131),v=n(60),m=n(135),w=n(128),g=n(2);var y=function(e){return Object(g.jsx)("div",{children:Object(g.jsx)(w.a,{margin:"dense",autoFocus:0===e.key,id:e.id,label:e.label,onChange:function(t){e.textChange(e.id,t.target.value)},fullWidth:!0,variant:"standard",helperText:e.helper})})},C=Object(v.a)({palette:{mode:"dark"}});var U=function(e){var t=function(){e.closeUI()},n=function(t,n){e.UpdateText(t,n)},c=e.rows;return Object(g.jsx)("div",{children:Object(g.jsx)(m.a,{theme:C,children:Object(g.jsxs)(b.a,{fullWidth:!0,maxWidth:"md",open:e.open,onClose:t,children:[Object(g.jsx)(x.a,{children:e.header}),Object(g.jsx)(O.a,{children:c.map((function(e,t){return Object(g.jsx)(y,{textChange:n,id:e.id,label:e.label,helper:e.helper},t)}))}),Object(g.jsxs)(p.a,{children:[Object(g.jsx)(h.a,{onClick:t,children:"Cancel"}),Object(g.jsx)(h.a,{onClick:function(){e.closeUI(!0)},children:"Submit"})]})]})})})},k=function(){var e=Object(c.useState)(!1),t=Object(o.a)(e,2),n=t[0],r=t[1],a=Object(c.useState)(""),i=Object(o.a)(a,2),u=i[0],d=i[1],j=Object(c.useState)([]),f=Object(o.a)(j,2),h=f[0],b=f[1];!function(e,t){var n=Object(c.useRef)(s);Object(c.useEffect)((function(){n.current=t}),[t]),Object(c.useEffect)((function(){var t=function(t){var c=t.data,r=c.action,a=c.data;n.current&&r===e&&n.current(a)};return window.addEventListener("message",t),function(){return window.removeEventListener("message",t)}}),[e])}("OPEN_MENU",(function(e){d(e.header),b(e.rows),r(!0)}));return Object(g.jsx)("div",{style:{display:n?"":"none"},children:Object(g.jsx)(U,{open:n,closeUI:function(e){!0===e?l("dataPost",h).then((function(e){})):l("cancel").then((function(e){})),r(!1)},UpdateText:function(e,t){var n=h;n.map((function(c,r){if(c.id===e)return c.input=t,void b(n)}))},openUI:function(){r(!0)},header:u,rows:h})})};i.a.render(Object(g.jsx)(r.a.StrictMode,{children:Object(g.jsx)(k,{})}),document.getElementById("root"))}},[[85,1,2]]]);
//# sourceMappingURL=main.f9a020b0.chunk.js.map