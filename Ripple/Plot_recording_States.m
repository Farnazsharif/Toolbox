
function Plot_recording_States(basePath)
  % Plot recording states
  % F.Sharif 2020    
    [~,recordingname] = fileparts(basePath);
    load([recordingname '.SleepState.states.mat'])
    load([recordingname '_sessInfo.mat'])



    figure ('position',[0 700 2000 200])
    alpha=.05; Beta=0.09;a=.07; b=.14;
    
    ya=8; i=1;
    M=sessInfo.Epochs.PREEpoch;
    if isempty(M)==0
    x=[M(i,1) M(i,1) M(i,2) M(i,2)]/3600;
    y=[0 ya  ya  0 ];
    fill(x,y,[236/256 247/256 252/256],'edgecolor','none')
    hold on
    end

    ya=8;
    M=sessInfo.Epochs.POSTEpoch;
    if isempty(M)==0
    x=[M(i,1) M(i,1) M(i,2) M(i,2)]/3600;
    y=[0 ya  ya  0 ];
    fill(x,y,[236/256 247/256 252/256],'edgecolor','none')
    hold on
    end

    ya=1;
    M=SleepState.ints.WAKEstate;
    if isempty(M)==0
    plot([M(:,1) M(:,2)]/3600,[ya ya],'linewidth',4,'color',[11 102 35]/256)
    dim = [alpha Beta a b];
    str = '--Wake';Cr=[11 102 35]/256;
    annotation('textbox',dim,'String',str,'color',Cr,'FontSize',12,'EdgeColor',Cr,'linewidth',3,'BackgroundColor',Cr,'FaceAlpha',0.2);
    hold on
    end

    ya=2;
    M=SleepState.ints.Thetastate;
    if isempty(M)==0
    plot([M(:,1) M(:,2)]/3600,[ya ya],'linewidth',4,'color',[76 187 23]/256)
     dim = [alpha Beta+.15 a b];
    str = '--Thetastate';Cr=[76 187 23]/256;
    annotation('textbox',dim,'String',str,'color',Cr,'FontSize',12,'EdgeColor',Cr,'linewidth',3,'BackgroundColor',Cr,'FaceAlpha',0.2);
    hold on
    end

    ya=3;
    M=SleepState.ints.Non_thetastate;
    if isempty(M)==0
    plot([M(:,1) M(:,2)]/3600,[ya ya],'linewidth',4,'color',[112 130 56]/256)
    dim = [alpha Beta+.3 a b];
    str = '--Non-thetastate';Cr=[112 130 56]/256;
    annotation('textbox',dim,'String',str,'color',Cr,'FontSize',12,'EdgeColor',Cr,'linewidth',3,'BackgroundColor',Cr,'FaceAlpha',0.2);
    hold on
    end

    ya=6;
    M=SleepState.ints.NREMstate;
    if isempty(M)==0
    plot([M(:,1) M(:,2)]/3600,[ya ya],'linewidth',4,'color','r')
    dim = [alpha Beta+.45 a b];
    str = '--NREMstate';Cr='r';
    annotation('textbox',dim,'String',str,'color',Cr,'FontSize',12,'EdgeColor',Cr,'linewidth',3,'BackgroundColor',Cr,'FaceAlpha',0.2);
    hold on
    end

    ya=7;
    M=SleepState.ints.REMstate;
    if isempty(M)==0
    plot([M(:,1) M(:,2)]/3600,[ya ya],'linewidth',4,'color','b')
    dim = [alpha Beta+.6 a b];
    str = '--REMstate';Cr='b';
    annotation('textbox',dim,'String',str,'color',Cr,'FontSize',12,'EdgeColor',Cr,'linewidth',3,'BackgroundColor',Cr,'FaceAlpha',0.2);
    hold on
    end

    ya=7.6;
    M=sessInfo.Epochs.MazeEpoch;
    if isempty(M)==0
    plot([M(i,1) M(i,2)]/3600,[ya ya],'linewidth',4,'color','k')
    dim = [alpha Beta+.75 a b];
    str = '--Behave';Cr='k';
    annotation('textbox',dim,'String',str,'color',Cr,'FontSize',12,'EdgeColor',Cr,'linewidth',3,'BackgroundColor',Cr,'FaceAlpha',0.2);
    end


    set(gcf,'Color','w')
    xlabel('Recording time (hr)','FontSize',12)
    title([recordingname ' - Recording States'],'FontSize',12)
    yticks([])
    xlim([0 sessInfo.Epochs.POSTEpoch(:,2)]./3600);
    box off



