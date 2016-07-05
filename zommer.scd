(
SynthDef(\zommer,
	{| gate = 1, amp = 1, pan = 0,
		freq = 100 |
		var sig, env;
		sig = SinOsc.ar(freq);
		env = EnvGen.kr(Env.asr, gate, doneAction: 2);
	Out.ar(0, Pan2.ar(sig * env, pan, amp));
}).add;
)

a = Synth(\zommer);

(

var rec = 0,
bassFreq = 76, bassFreqMax = 80,
hatFreq = 1000,
timeMul = 1/4, ampMul = 1,
onebeat = 2.666666666666/4, // 4 * beat = 1 bar
syn = 0;

~p_1 = Pbind(
	\instrument,        \zommer,
	\dur,    Pseq([Pseq([onebeat*2/7, onebeat*3*4]*timeMul, 3)], 2),
	\freq, Pseq([500, 700, 400, 600, 350, 345 + (10.rand - 5)], inf),
	\amp, 0.4*ampMul;
);

~p_2 = Pbind(
	\instrument,        \zommer,
	\dur,    Pseq([Pseq([
		onebeat*4/7, onebeat*3/7, onebeat*7,
		onebeat*4/7, onebeat*3/7, onebeat*7]*timeMul, 3)], 2),
	\freq, Pseq([350, 400, 500, 360], inf),
	\amp, 0.4*ampMul;
);

~p_3 = Pbind(
	\instrument,        \zommer,
	\dur,    Pseq([Pseq([
		onebeat*5/7, onebeat*5/7, onebeat*5/7, onebeat*5/7,
		onebeat*5/7, onebeat*6/7, onebeat*6/7, onebeat*2]*timeMul, 2)], 2),
	\freq, Pseq(
		[
	Pseq([250, 252, 250, 250, 300, 280, 290, 300], 1),
	Pseq([250, 252, 250, 250, 300, 280, 300, 250], 1)
	], 2),
	\amp, 0.4*ampMul;
);



)
~p_1.play;
~p_2.play;
~p_3.play;



345 + (10.rand - 5)