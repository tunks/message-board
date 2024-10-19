import{computePosition as e,arrow as t,offset as n,shift as r,limitShift as o,flip as s,size as u,autoPlacement as i,hide as f,inline as a}from"@floating-ui/dom";export{autoUpdate,computePosition,detectOverflow,getOverflowAncestors,platform}from"@floating-ui/dom";import*as c from"react";import{useLayoutEffect as l,useEffect as p}from"react";import*as d from"react-dom";var m=typeof document!=="undefined"?l:p;function deepEqual(e,t){if(e===t)return true;if(typeof e!==typeof t)return false;if(typeof e==="function"&&e.toString()===t.toString())return true;let n;let r;let o;if(e&&t&&typeof e==="object"){if(Array.isArray(e)){n=e.length;if(n!==t.length)return false;for(r=n;r--!==0;)if(!deepEqual(e[r],t[r]))return false;return true}o=Object.keys(e);n=o.length;if(n!==Object.keys(t).length)return false;for(r=n;r--!==0;)if(!{}.hasOwnProperty.call(t,o[r]))return false;for(r=n;r--!==0;){const n=o[r];if((n!=="_owner"||!e.$$typeof)&&!deepEqual(e[n],t[n]))return false}return true}return e!==e&&t!==t}function getDPR(e){if(typeof window==="undefined")return 1;const t=e.ownerDocument.defaultView||window;return t.devicePixelRatio||1}function roundByDPR(e,t){const n=getDPR(e);return Math.round(t*n)/n}function useLatestRef(e){const t=c.useRef(e);m((()=>{t.current=e}));return t}function useFloating(t){t===void 0&&(t={});const{placement:n="bottom",strategy:r="absolute",middleware:o=[],platform:s,elements:{reference:u,floating:i}={},transform:f=true,whileElementsMounted:a,open:l}=t;const[p,g]=c.useState({x:0,y:0,strategy:r,placement:n,middlewareData:{},isPositioned:false});const[y,R]=c.useState(o);deepEqual(y,o)||R(o);const[w,P]=c.useState(null);const[h,S]=c.useState(null);const b=c.useCallback((e=>{if(e!==M.current){M.current=e;P(e)}}),[]);const x=c.useCallback((e=>{if(e!==O.current){O.current=e;S(e)}}),[]);const D=u||w;const E=i||h;const M=c.useRef(null);const O=c.useRef(null);const k=c.useRef(p);const q=a!=null;const v=useLatestRef(a);const C=useLatestRef(s);const L=useLatestRef(l);const j=c.useCallback((()=>{if(!M.current||!O.current)return;const t={placement:n,strategy:r,middleware:y};C.current&&(t.platform=C.current);e(M.current,O.current,t).then((e=>{const t={...e,isPositioned:L.current!==false};if(A.current&&!deepEqual(k.current,t)){k.current=t;d.flushSync((()=>{g(t)}))}}))}),[y,n,r,C,L]);m((()=>{if(l===false&&k.current.isPositioned){k.current.isPositioned=false;g((e=>({...e,isPositioned:false})))}}),[l]);const A=c.useRef(false);m((()=>{A.current=true;return()=>{A.current=false}}),[]);m((()=>{D&&(M.current=D);E&&(O.current=E);if(D&&E){if(v.current)return v.current(D,E,j);j()}}),[D,E,j,v,q]);const B=c.useMemo((()=>({reference:M,floating:O,setReference:b,setFloating:x})),[b,x]);const F=c.useMemo((()=>({reference:D,floating:E})),[D,E]);const $=c.useMemo((()=>{const e={position:r,left:0,top:0};if(!F.floating)return e;const t=roundByDPR(F.floating,p.x);const n=roundByDPR(F.floating,p.y);return f?{...e,transform:"translate("+t+"px, "+n+"px)",...getDPR(F.floating)>=1.5&&{willChange:"transform"}}:{position:r,left:t,top:n}}),[r,f,F.floating,p.x,p.y]);return c.useMemo((()=>({...p,update:j,refs:B,elements:F,floatingStyles:$})),[p,j,B,F,$])}const arrow$1=e=>{function isRef(e){return{}.hasOwnProperty.call(e,"current")}return{name:"arrow",options:e,fn(n){const{element:r,padding:o}=typeof e==="function"?e(n):e;return r&&isRef(r)?r.current!=null?t({element:r.current,padding:o}).fn(n):{}:r?t({element:r,padding:o}).fn(n):{}}}};const offset=(e,t)=>({...n(e),options:[e,t]});const shift=(e,t)=>({...r(e),options:[e,t]});const limitShift=(e,t)=>({...o(e),options:[e,t]});const flip=(e,t)=>({...s(e),options:[e,t]});const size=(e,t)=>({...u(e),options:[e,t]});const autoPlacement=(e,t)=>({...i(e),options:[e,t]});const hide=(e,t)=>({...f(e),options:[e,t]});const inline=(e,t)=>({...a(e),options:[e,t]});const arrow=(e,t)=>({...arrow$1(e),options:[e,t]});export{arrow,autoPlacement,flip,hide,inline,limitShift,offset,shift,size,useFloating};

