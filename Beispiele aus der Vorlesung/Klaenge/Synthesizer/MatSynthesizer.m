%% MatSynth by KalMa    #MatFunZone (2018)
%  contact: maciej.kalarus@gmail.com
%  ------------------------------------------------------------------------
% use keyboard or mouse to play
% use mouse to change amplitude profile and shape of the waves
function MatSynthesizer
    global Synth
    
    Name                    = 'MatSynthesizer';
    Version                 = 1.0;
    
    %% Tones
    RefTone                 = 440;                                      % [Hz] - reference tone (A)
    ToneId                  = -9:27;                                    % with respect to reference tone (0-A) (e.g. [-2,-1,0,1] means [G G# A A#])
    ToneName                = {'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#' 'A' 'A#' 'B'};
    Synth.Tones.Fs          = 16384;                                    % [Hz] - sampling frequency 
    Synth.Tones.Frequency   = RefTone * 2.^(ToneId/12);                 % table of frequencies [Hz]
    Synth.Keyboard          = {'z' 'x' 'd' 'c' 'f' 'v' 'b' 'h' 'n' 'j' 'm' 'k' 'comma' 'period' 'semicolon' 'slash'};   % defines keyboard (Matlab notation)
    KeyboardMarker          = {'z' 'x' 'd' 'c' 'f' 'v' 'b' 'h' 'n' 'j' 'm' 'k' ','     '.'      ';'         '/'};
    Synth.Tones.Sample      = cell(size(ToneId));
    %% Keys
    Key(1)                  = struct('X',[-0.5 0.5 0.5 -0.5], 'Y',[0 0 3 3], 'Color','white');
    Key(2)                  = struct('X',[-0.4 0.4 0.4 -0.4], 'Y',[1 1 3 3], 'Color','black');
    KeyName                 = ToneName(mod(ToneId+9,12)+1);
    KeyColorId              = cellfun(@(x) (length(x)==2)+1, KeyName);  % 1-white, 2-black
    Synth.KeyboardToneId    = (1-length(Synth.Keyboard):0) + find(strcmp(KeyName,'D'),1,'last');    % 'slash' = first D from the left side
                              
    %% Board
    KeyScale        = 40;                                               % change this value to resize Synth
    Size            = [sum(KeyColorId==1)+1, 3] * KeyScale + [0 60];    % depends on number of white keys
    Color           = [0.8 0.8 0.9];
    BackgroundColor = [0.4 0.4 0.8];
    %% Application window
    ScreenSize = get(0,'ScreenSize');
    figure( 'Units','pixels',...
            'Renderer','painters',...
            'Position',[(ScreenSize(3:4) - Size)*0.5, Size] + [0 0 10 27],...
            'MenuBar','none',...
            'NumberTitle','off',...
            'Resize','off',...
            'Color',BackgroundColor,...
            'Name',[Name, ' by KalMa'],...
            'KeyPressFcn',@(~,evt)KeyPress(evt.Key));
    
    axes( 'Units','pixels',...
          'Position',[5 5 Size],...
          'NextPlot','add',...
          'box','on',...
          'Color',Color,...
          'xlim',[0 Size(1)],...
          'ylim',[0 Size(2)],...
          'XTick',[],...
          'YTick',[]);
    
    title(sprintf('%s v%0.1f', Name, Version));
    %% Create keyboard
    nTone           = length(ToneId);
    KeyBoard(nTone) = matlab.graphics.primitive.Patch;
    X = KeyScale;
    for i = 1:nTone
        cid = KeyColorId(i);
        x = X + (Key(cid).X - (cid==2)*0.5)*KeyScale;
        y = 5 + Key(cid).Y*KeyScale;
        KeyBoard(i) = patch(x,y,Key(cid).Color,'ButtonDownFcn',@(~,~)MousePress(i));
        if (cid==1), uistack(KeyBoard(i),'bottom'); end;
        text(mean(x(1:2)),y(1)+12,KeyName{i},'Color',Key(3-cid).Color,'HorizontalAlignment','center','PickableParts','none');
        id = find(Synth.KeyboardToneId==i);
        if ~isempty(id)
            text(mean(x(1:2)),y(1)+30,KeyboardMarker{id},'Color',[0.5 0.5 0.5],'HorizontalAlignment','center','PickableParts','none');
        end
        X = X + (cid==1)*KeyScale;
    end
    
    text([120;120],Size(2)-[15;35],{'shape:','amplitude profile:'},'HorizontalAlignment','right','FontWeight','bold');
    Synth.hShape     = text((130:90:580)',ones(6,1)*(Size(2)-15),{'sinus','square','triangle','3 sin','pwm','sin vibrato'},'ButtonDownFcn',@(src,~)ChangeShape(src));
    Synth.hAmplitude = text((130:90:220)',ones(2,1)*(Size(2)-35),{'constant','decending'},'ButtonDownFcn',@(src,~)ChangeAmplitude(src));
    %% Initial settings
    Synth.ToneShapeId       = 1;
    Synth.ToneAmplitudeId   = 1;
    CreateSamples();
end
function ChangeShape(src)
    global Synth
    Synth.ToneShapeId = find(Synth.hShape==src);
    CreateSamples();
end
function ChangeAmplitude(src)
    global Synth
    Synth.ToneAmplitudeId = find(Synth.hAmplitude==src);
    CreateSamples();
end
function CreateSamples()
    global Synth
    set([Synth.hShape; Synth.hAmplitude],'Color','black');
    set([Synth.hShape(Synth.ToneShapeId); Synth.hAmplitude(Synth.ToneAmplitudeId)],'Color','yellow');
    T   = 0.5;                                      % sound duration [s]
    % amplitude
    switch Synth.ToneAmplitudeId
        case 1                                      % constant
            Amp = linspace(1,1,Synth.Tones.Fs*T);
        case 2                                      % decending
            Amp = linspace(1,0,Synth.Tones.Fs*T);
    end
    % shape
    t   = linspace(0,T,Synth.Tones.Fs*T);
    for i=1:length(Synth.Tones.Sample)
        a = 2*pi*Synth.Tones.Frequency(i)*t;
        switch Synth.ToneShapeId
            case 1                                  % sinus
                s = sin(a);
            case 2                                  % square
                s = (2*(sin(a)>0)-1)*0.6;
            case 3                                  % triangle
                N = 1:2:13;
                s = sum(sin(N'*a).^2 .* ((4/pi./N)'.^2*ones(size(t)))) - 1;
            case 4                                  % 3 sin
                s = 0.6*sin(a) + 0.3*sin(a*2) +0.1*sin(a*4);
            case 5                                  % pwm
                q = linspace(0,1,Synth.Tones.Fs*T);
                s = (2*((sin(a)+q)>0)-1)*0.6;
            case 6                                  % vibrato
                q = sin(2*pi*4*t)*0.001;
                s = sin(a+2*pi*Synth.Tones.Frequency(i)*q);
        end
        Synth.Tones.Sample{i} = s.*Amp;
    end
end
function MousePress(ToneId)
    global Synth
    sound(Synth.Tones.Sample{ToneId}, Synth.Tones.Fs);
end
function KeyPress(key)
    global Synth
    id = find(ismember(Synth.Keyboard,key));
    if ~isempty(id)
        ToneId = Synth.KeyboardToneId(id);
        if (ToneId>0)
            sound(Synth.Tones.Sample{ToneId}, Synth.Tones.Fs);
        end
    end
end