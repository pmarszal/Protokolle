% COMSOL Multiphysics Model M-file
% Generated by COMSOL 3.5a (COMSOL 3.5.0.603, $Date: 2008/12/03 17:02:19 $)
% Some geometry objects are stored in a separate file.
% The name of this file is given by the variable 'flbinaryfile'.

flclear fem

% COMSOL version
clear vrsn
vrsn.name = 'COMSOL 3.5';
vrsn.ext = 'a';
vrsn.major = 0;
vrsn.build = 603;
vrsn.rcs = '$Name:  $';
vrsn.date = '$Date: 2008/12/03 17:02:19 $';
fem.version = vrsn;

flbinaryfile='';

% Constants
fem.const = {'Ra_c','1e7', ...
  'Pr_c','7'};

% Geometry
clear draw
g1=flbinary('g1','draw',flbinaryfile);
draw.s.objs = {g1};
draw.s.name = {'R1'};
draw.s.tags = {'g1'};
fem.draw = draw;
fem.geom = geomcsg(fem);
fem.mesh = flbinary('m1','mesh',flbinaryfile);

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'FlNavierStokes';
appl.gporder = {4,2};
appl.cporder = {2,1};
appl.assignsuffix = '_ns';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm1','lm2','lmp'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear pnt
pnt.pnton = {0,1};
pnt.ind = [2,1,1,1];
appl.pnt = pnt;
clear bnd
bnd.type = 'walltype';
bnd.ind = [1,1,1,1];
appl.bnd = bnd;
clear equ
equ.eta = 'Pr_c';
equ.gporder = {{1;1;2}};
equ.F_y = 'Ra_c*Pr_c*c';
equ.cporder = {{1;1;2}};
equ.cdon = 0;
equ.sdon = 0;
equ.ind = [1];
appl.equ = equ;
fem.appl{1} = appl;

% Application mode 2
clear appl
appl.mode.class = 'FlConvDiff';
appl.assignsuffix = '_cd';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm3'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear bnd
bnd.c0 = {0,1,0,1};
bnd.type = {'N0','C','C','N0'};
bnd.ind = [1,2,3,4];
appl.bnd = bnd;
clear equ
equ.v = 'v';
equ.u = 'u';
equ.ind = [1];
appl.equ = equ;
fem.appl{2} = appl;
fem.frame = {'ref'};
fem.border = 1;

% Coupling variable elements
clear elemcpl
% Integration coupling variables
clear elem
elem.elem = 'elcplscalar';
elem.g = {'1'};
src = cell(1,1);
clear bnd
bnd.expr = {{{},'-cy',{}}};
bnd.ipoints = {{{},'4',{}}};
bnd.frame = {{{},'ref','ref'}};
bnd.ind = {{'1','2'},{'3'},{'4'}};
src{1} = {{},bnd,{}};
elem.src = src;
geomdim = cell(1,1);
clear pnt
pnt.usage = {{'1'}};
pnt.ind = {{'3'}};
geomdim{1} = {pnt,{},{}};
elem.geomdim = geomdim;
elem.var = {'Nu_c'};
elem.global = {};
elem.maxvars = {};
elemcpl{1} = elem;
fem.elemcpl = elemcpl;

% Descriptions
clear descr
descr.const= {'Ra_c','Rayleigh number for c','Pr_c','Prandtl number for c'};
fem.descr = descr;

% Multiphysics
fem=multiphysics(fem);

% Extend mesh
fem.xmesh=meshextend(fem, ...
                     'linshape',[], ...
                     'dofversion',1);

% Retrieve solution
fem.sol=flbinary('sol1','solution',flbinaryfile);

% Save current fem structure for restart purposes
fem0=fem;
% COMSOL Multiphysics Model M-file
% Generated by COMSOL 3.5a (COMSOL 3.5.0.603, $Date: 2008/12/03 17:02:19 $)
% Some geometry objects are stored in a separate file.
% The name of this file is given by the variable 'flbinaryfile'.

flbinaryfile='';

% Plot in cross-section or along domain
postcrossplot(fem,1,[.05 0.5;0 1], ...
              'lindata','c', ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[.05 0.5;0 1], ...
              'lindata','c', ...
              'solnum',[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[.05 0.5;0 1], ...
              'lindata','U_ns', ...
              'solnum',[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Velocity field', ...
              'axislabel',{'Arc-length','Velocity field'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','U_ns', ...
              'solnum',[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Velocity field', ...
              'axislabel',{'Arc-length','Velocity field'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'solnum',[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','U_ns', ...
              'solnum',[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Velocity field', ...
              'axislabel',{'Arc-length','Velocity field'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'solnum',[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Constants
fem.const = {'Ra_c','1e3', ...
  'Pr_c','7'};

% Constants
fem.const = {'Ra_c','1e3', ...
  'Pr_c','7'};

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'FlNavierStokes';
appl.gporder = {4,2};
appl.cporder = {2,1};
appl.assignsuffix = '_ns';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm1','lm2','lmp'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear pnt
pnt.pnton = {0,1};
pnt.ind = [2,1,1,1];
appl.pnt = pnt;
clear bnd
bnd.type = 'walltype';
bnd.ind = [1,1,1,1];
appl.bnd = bnd;
clear equ
equ.eta = 'Pr_c';
equ.gporder = {{1;1;2}};
equ.F_y = 'Ra_c*Pr_c*c';
equ.cporder = {{1;1;2}};
equ.cdon = 0;
equ.sdon = 0;
equ.ind = [1];
appl.equ = equ;
fem.appl{1} = appl;

% Application mode 2
clear appl
appl.mode.class = 'FlConvDiff';
appl.assignsuffix = '_cd';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm3'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear bnd
bnd.c0 = {0,1,0,1};
bnd.type = {'N0','C','C','N0'};
bnd.ind = [1,2,3,4];
appl.bnd = bnd;
clear equ
equ.v = 'v';
equ.u = 'u';
equ.ind = [1];
appl.equ = equ;
fem.appl{2} = appl;
fem.frame = {'ref'};
fem.border = 1;

% Coupling variable elements
clear elemcpl
% Integration coupling variables
clear elem
elem.elem = 'elcplscalar';
elem.g = {'1'};
src = cell(1,1);
clear bnd
bnd.expr = {{{},'-cy',{}}};
bnd.ipoints = {{{},'4',{}}};
bnd.frame = {{{},'ref','ref'}};
bnd.ind = {{'1','2'},{'3'},{'4'}};
src{1} = {{},bnd,{}};
elem.src = src;
geomdim = cell(1,1);
clear pnt
pnt.usage = {{'1'}};
pnt.ind = {{'3'}};
geomdim{1} = {pnt,{},{}};
elem.geomdim = geomdim;
elem.var = {'Nu_c'};
elem.global = {};
elem.maxvars = {};
elemcpl{1} = elem;
fem.elemcpl = elemcpl;

% Descriptions
clear descr
descr.const= {'Ra_c','Rayleigh number for c','Pr_c','Prandtl number for c'};
fem.descr = descr;

% Multiphysics
fem=multiphysics(fem);

% Extend mesh
fem.xmesh=meshextend(fem, ...
                     'linshape',[]);

% Solve problem
fem.sol=femtime(fem, ...
                'symmetric','off', ...
                'solcomp',{'v','u','c','p'}, ...
                'outcomp',{'v','u','c','p'}, ...
                'blocksize','auto', ...
                'plotint','-cy', ...
                'plotintpar',{'recover','off','phase',0,'geomnum',1,'edim',1,'intorder',4,'dl',3}, ...
                'tlist',[colon(0,0.1,5)], ...
                'tout','tlist');

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
postplot(fem, ...
         'tridata',{'c','cont','internal'}, ...
         'trimap','Rainbow', ...
         'arrowdata',{'u','v'}, ...
         'arrowxspacing',16, ...
         'arrowyspacing',16, ...
         'arrowtype','arrow', ...
         'arrowstyle','proportional', ...
         'arrowcolor',[0.0,0.0,0.0], ...
         'solnum','end', ...
         'title','Time=5    Surface: Concentration, c   Arrow: Velocity field', ...
         'axis',[-0.45446524743370387,1.4544652474337036,-0.2521814604261493,1.2521814604261492]);

% Constants
fem.const = {'Ra_c','1e4', ...
  'Pr_c','7'};

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'FlNavierStokes';
appl.gporder = {4,2};
appl.cporder = {2,1};
appl.assignsuffix = '_ns';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm1','lm2','lmp'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear pnt
pnt.pnton = {0,1};
pnt.ind = [2,1,1,1];
appl.pnt = pnt;
clear bnd
bnd.type = 'walltype';
bnd.ind = [1,1,1,1];
appl.bnd = bnd;
clear equ
equ.eta = 'Pr_c';
equ.gporder = {{1;1;2}};
equ.F_y = 'Ra_c*Pr_c*c';
equ.cporder = {{1;1;2}};
equ.cdon = 0;
equ.sdon = 0;
equ.ind = [1];
appl.equ = equ;
fem.appl{1} = appl;

% Application mode 2
clear appl
appl.mode.class = 'FlConvDiff';
appl.assignsuffix = '_cd';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm3'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear bnd
bnd.c0 = {0,1,0,1};
bnd.type = {'N0','C','C','N0'};
bnd.ind = [1,2,3,4];
appl.bnd = bnd;
clear equ
equ.v = 'v';
equ.u = 'u';
equ.ind = [1];
appl.equ = equ;
fem.appl{2} = appl;
fem.frame = {'ref'};
fem.border = 1;

% Coupling variable elements
clear elemcpl
% Integration coupling variables
clear elem
elem.elem = 'elcplscalar';
elem.g = {'1'};
src = cell(1,1);
clear bnd
bnd.expr = {{{},'-cy',{}}};
bnd.ipoints = {{{},'4',{}}};
bnd.frame = {{{},'ref','ref'}};
bnd.ind = {{'1','2'},{'3'},{'4'}};
src{1} = {{},bnd,{}};
elem.src = src;
geomdim = cell(1,1);
clear pnt
pnt.usage = {{'1'}};
pnt.ind = {{'3'}};
geomdim{1} = {pnt,{},{}};
elem.geomdim = geomdim;
elem.var = {'Nu_c'};
elem.global = {};
elem.maxvars = {};
elemcpl{1} = elem;
fem.elemcpl = elemcpl;

% Descriptions
clear descr
descr.const= {'Ra_c','Rayleigh number for c','Pr_c','Prandtl number for c'};
fem.descr = descr;

% Multiphysics
fem=multiphysics(fem);

% Extend mesh
fem.xmesh=meshextend(fem, ...
                     'linshape',[]);

% Solve problem
fem.sol=femtime(fem, ...
                'symmetric','off', ...
                'solcomp',{'v','u','c','p'}, ...
                'outcomp',{'v','u','c','p'}, ...
                'blocksize','auto', ...
                'plotint','-cy', ...
                'plotintpar',{'recover','off','phase',0,'geomnum',1,'edim',1,'intorder',4,'dl',3}, ...
                'tlist',[colon(0,0.1,5)], ...
                'tout','tlist');

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
postplot(fem, ...
         'tridata',{'c','cont','internal'}, ...
         'trimap','Rainbow', ...
         'arrowdata',{'u','v'}, ...
         'arrowxspacing',16, ...
         'arrowyspacing',16, ...
         'arrowtype','arrow', ...
         'arrowstyle','proportional', ...
         'arrowcolor',[0.0,0.0,0.0], ...
         'solnum','end', ...
         'title','Time=5    Surface: Concentration, c   Arrow: Velocity field', ...
         'axis',[-0.45446524743370387,1.4544652474337036,-0.2521814604261493,1.2521814604261492]);

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'solnum',[11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'solnum',[11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','U_ns', ...
              'solnum',[11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Velocity field', ...
              'axislabel',{'Arc-length','Velocity field'});

% Constants
fem.const = {'Ra_c','1e3', ...
  'Pr_c','7'};

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'FlNavierStokes';
appl.gporder = {4,2};
appl.cporder = {2,1};
appl.assignsuffix = '_ns';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm1','lm2','lmp'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear pnt
pnt.pnton = {0,1};
pnt.ind = [2,1,1,1];
appl.pnt = pnt;
clear bnd
bnd.type = 'walltype';
bnd.ind = [1,1,1,1];
appl.bnd = bnd;
clear equ
equ.eta = 'Pr_c';
equ.gporder = {{1;1;2}};
equ.F_y = 'Ra_c*Pr_c*c';
equ.cporder = {{1;1;2}};
equ.cdon = 0;
equ.sdon = 0;
equ.ind = [1];
appl.equ = equ;
fem.appl{1} = appl;

% Application mode 2
clear appl
appl.mode.class = 'FlConvDiff';
appl.assignsuffix = '_cd';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm3'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear bnd
bnd.c0 = {0,1,0,1};
bnd.type = {'N0','C','C','N0'};
bnd.ind = [1,2,3,4];
appl.bnd = bnd;
clear equ
equ.v = 'v';
equ.u = 'u';
equ.ind = [1];
appl.equ = equ;
fem.appl{2} = appl;
fem.frame = {'ref'};
fem.border = 1;

% Coupling variable elements
clear elemcpl
% Integration coupling variables
clear elem
elem.elem = 'elcplscalar';
elem.g = {'1'};
src = cell(1,1);
clear bnd
bnd.expr = {{{},'-cy',{}}};
bnd.ipoints = {{{},'4',{}}};
bnd.frame = {{{},'ref','ref'}};
bnd.ind = {{'1','2'},{'3'},{'4'}};
src{1} = {{},bnd,{}};
elem.src = src;
geomdim = cell(1,1);
clear pnt
pnt.usage = {{'1'}};
pnt.ind = {{'3'}};
geomdim{1} = {pnt,{},{}};
elem.geomdim = geomdim;
elem.var = {'Nu_c'};
elem.global = {};
elem.maxvars = {};
elemcpl{1} = elem;
fem.elemcpl = elemcpl;

% Descriptions
clear descr
descr.const= {'Ra_c','Rayleigh number for c','Pr_c','Prandtl number for c'};
fem.descr = descr;

% Multiphysics
fem=multiphysics(fem);

% Extend mesh
fem.xmesh=meshextend(fem, ...
                     'linshape',[]);

% Solve problem
fem.sol=femtime(fem, ...
                'symmetric','off', ...
                'solcomp',{'v','u','c','p'}, ...
                'outcomp',{'v','u','c','p'}, ...
                'blocksize','auto', ...
                'plotint','-cy', ...
                'plotintpar',{'recover','off','phase',0,'geomnum',1,'edim',1,'intorder',4,'dl',3}, ...
                'tlist',[colon(0,0.1,5)], ...
                'tout','tlist');

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
postplot(fem, ...
         'tridata',{'c','cont','internal'}, ...
         'trimap','Rainbow', ...
         'arrowdata',{'u','v'}, ...
         'arrowxspacing',16, ...
         'arrowyspacing',16, ...
         'arrowtype','arrow', ...
         'arrowstyle','proportional', ...
         'arrowcolor',[0.0,0.0,0.0], ...
         'solnum','end', ...
         'title','Time=5    Surface: Concentration, c   Arrow: Velocity field', ...
         'axis',[-0.45446524743370387,1.4544652474337036,-0.2521814604261493,1.2521814604261492]);

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','U_ns', ...
              'solnum',[12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Velocity field', ...
              'axislabel',{'Arc-length','Velocity field'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'solnum',[12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Constants
fem.const = {'Ra_c','1e5', ...
  'Pr_c','7'};

% Constants
fem.const = {'Ra_c','1e5', ...
  'Pr_c','7'};

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'FlNavierStokes';
appl.gporder = {4,2};
appl.cporder = {2,1};
appl.assignsuffix = '_ns';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm1','lm2','lmp'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear pnt
pnt.pnton = {0,1};
pnt.ind = [2,1,1,1];
appl.pnt = pnt;
clear bnd
bnd.type = 'walltype';
bnd.ind = [1,1,1,1];
appl.bnd = bnd;
clear equ
equ.eta = 'Pr_c';
equ.gporder = {{1;1;2}};
equ.F_y = 'Ra_c*Pr_c*c';
equ.cporder = {{1;1;2}};
equ.cdon = 0;
equ.sdon = 0;
equ.ind = [1];
appl.equ = equ;
fem.appl{1} = appl;

% Application mode 2
clear appl
appl.mode.class = 'FlConvDiff';
appl.assignsuffix = '_cd';
clear prop
clear weakconstr
weakconstr.value = 'off';
weakconstr.dim = {'lm3'};
prop.weakconstr = weakconstr;
appl.prop = prop;
clear bnd
bnd.c0 = {0,1,0,1};
bnd.type = {'N0','C','C','N0'};
bnd.ind = [1,2,3,4];
appl.bnd = bnd;
clear equ
equ.v = 'v';
equ.u = 'u';
equ.ind = [1];
appl.equ = equ;
fem.appl{2} = appl;
fem.frame = {'ref'};
fem.border = 1;

% Coupling variable elements
clear elemcpl
% Integration coupling variables
clear elem
elem.elem = 'elcplscalar';
elem.g = {'1'};
src = cell(1,1);
clear bnd
bnd.expr = {{{},'-cy',{}}};
bnd.ipoints = {{{},'4',{}}};
bnd.frame = {{{},'ref','ref'}};
bnd.ind = {{'1','2'},{'3'},{'4'}};
src{1} = {{},bnd,{}};
elem.src = src;
geomdim = cell(1,1);
clear pnt
pnt.usage = {{'1'}};
pnt.ind = {{'3'}};
geomdim{1} = {pnt,{},{}};
elem.geomdim = geomdim;
elem.var = {'Nu_c'};
elem.global = {};
elem.maxvars = {};
elemcpl{1} = elem;
fem.elemcpl = elemcpl;

% Descriptions
clear descr
descr.const= {'Ra_c','Rayleigh number for c','Pr_c','Prandtl number for c'};
fem.descr = descr;

% Multiphysics
fem=multiphysics(fem);

% Extend mesh
fem.xmesh=meshextend(fem, ...
                     'linshape',[]);

% Solve problem
fem.sol=femtime(fem, ...
                'symmetric','off', ...
                'solcomp',{'v','u','c','p'}, ...
                'outcomp',{'v','u','c','p'}, ...
                'blocksize','auto', ...
                'plotint','-cy', ...
                'plotintpar',{'recover','off','phase',0,'geomnum',1,'edim',1,'intorder',4,'dl',3}, ...
                'tlist',[colon(0,0.1,5)], ...
                'tout','tlist');

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
postplot(fem, ...
         'tridata',{'c','cont','internal'}, ...
         'trimap','Rainbow', ...
         'arrowdata',{'u','v'}, ...
         'arrowxspacing',16, ...
         'arrowyspacing',16, ...
         'arrowtype','arrow', ...
         'arrowstyle','proportional', ...
         'arrowcolor',[0.0,0.0,0.0], ...
         'solnum','end', ...
         'title','Time=5    Surface: Concentration, c   Arrow: Velocity field', ...
         'axis',[-0.45446524743370387,1.4544652474337036,-0.2521814604261493,1.2521814604261492]);

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'solnum',[12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','U_ns', ...
              'solnum',[12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Velocity field', ...
              'axislabel',{'Arc-length','Velocity field'});

% Constants
fem.const = {'Ra_c','1e6', ...
  'Pr_c','7'};

% Constants
fem.const = {'Ra_c','1e6', ...
  'Pr_c','7'};

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','U_ns', ...
              'solnum',[12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Velocity field', ...
              'axislabel',{'Arc-length','Velocity field'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','U_ns', ...
              'solnum',[12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Velocity field', ...
              'axislabel',{'Arc-length','Velocity field'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'solnum',[12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});

% Plot in cross-section or along domain
postcrossplot(fem,1,[0.5 0.5;0 1], ...
              'lindata','c', ...
              'solnum',[12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51], ...
              'title','Concentration, c', ...
              'axislabel',{'Arc-length','Concentration',' c'});
