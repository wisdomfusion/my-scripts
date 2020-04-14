#!/usr/bin/env perl
use v5.30.0;
use strict;
use warnings qw( all );

use Data::Dump qw(dump);

while (<DATA>) {
    chomp;
    
    my ($no, $word) = split /\t/;
    
    $_ = $word;
    
    s/‘/'/g;
    s/…/.../g;
    s/（/\(/g;
    s/）/)/g;
    s/\(/ \(/g;
    s/\)/\) /g;
    s/\s+\(s\)/\(s\)/;
    s/？/?/g;
    s/！/!/g;
    s/\.{4,}/.../g;
    s/\.\.\./ $& /g;
    s/\.\.\.\s+([?!])/...$1/;
    
    s/\s{2,}/ /g;
    s/^\s+//;
    s/\s+$//;

    say $no, "\t", $_;
}


__DATA__
1	(all) over again
2	(as) flat as a pancake
3	(be) able to
4	(be) accepted as
5	(be) accused of ...
6	(be) addicted to ...
7	(be) allergic to
8	(be) ashamed of
9	(be) associated with
10	(be) aware of
11	(be) bad for
12	(be) blessed with
13	(be) born
14	(be) bound to (do) ...
15	(be) busy with
16	(be) careful with
17	(be) connected to
18	(be) contrary to
19	(be) deep in thought
20	(be) dying to
21	(be) dying to (do sth.)
22	(be) eager to
23	(be) faced with
24	(be) faithful to ...
25	(be) famous for
26	(be) full of
27	(be) given to something
28	(be) good at
29	(be) good for
30	(be) happy with
31	(be) identical to
32	(be) in trouble
33	(be) interested in
34	(be) kind to ...
35	(be) known as
36	(be) known as sth.
37	(be) laden with
38	(be) late for
39	(be) made of
40	(be) made of ...
41	(be) made up of
42	(be) nervous about
43	(be) nostalgic for
44	(be) of medium build
45	(be) of medium height
46	(be) on a diet
47	(be) on business
48	(be) on good terms with
49	(be) on time
50	(be) prepared to do sth.
51	(be) ready for ...
52	(be) restricted to
53	(be) rich in
54	(be) scared to death
55	(be) strict about
56	(be) strict with ...
57	(be) the same with
58	(be) true of/for
59	(be) weak in
60	(be) worried about
61	(comic) strip
62	(every) now and then
63	(not) at all
64	(one) hundred
65	(the) Bible
66	(the) Netherlands
67	... o'clock
68	... times as long as
69	... years old
70	15℃
71	1st
72	20th
73	21st
74	22nd
75	23rd
76	2nd
77	2-way radio
78	30th
79	31st
80	3-D
81	3rd
82	4th
83	a
84	a (an)
85	a (great) number of
86	a bag of
87	a balanced diet
88	a basket of ...
89	a big deal
90	a bird's eye view
91	a bit
92	a bit of
93	a bit of ...
94	a bottle of
95	a bottle of ...
96	a box of
97	a box of crayons
98	a bunch of
99	a can of ...
100	a can of soda
101	a case in point
102	a chess set
103	a chorus of
104	A Christmas Carol
105	a collection of ...
106	a couple of
107	a couple of ...
108	a crowd of
109	a cup of
110	a cup of ...
111	a cup of tea
112	a distant cousin
113	a fear of heights
114	a few
115	a few times
116	a field trip
117	a flower bud
118	a glass of
119	a glass of ...
120	a glass of juice
121	a good amount of
122	a good knowledge of
123	a good Samaritan
124	a great deal
125	a great deal of
126	a great deal of ...
127	a great deal(of)
128	a great many
129	a great number of
130	a guilty conscience
131	a handful of
132	a huge amount of
133	a huge number of
134	a hunting rifle
135	a jet fighter
136	a kind of
137	a knife and fork
138	a large amount of ...
139	a large breakfast
140	a list of ...
141	a little
142	a little bit
143	a little while
144	a living fossil
145	a long time ago
146	a look of ...
147	a lot
148	a lot of
149	a matter of pride
150	a matter of sth.
151	a minimum supply of
152	a nationwide network
153	a number of
154	a one-stop shop
155	a one-way ticket
156	a packet of
157	a pain in the neck
158	a pair of
159	a pair of scissors
160	a photographic plate
161	a piece of
162	a piece of cake
163	a piece of clothing
164	a pool of
165	a power source
166	a quarter
167	a quarter to ...
168	a range of
169	a range of ...
170	A rather than B
171	a rush of
172	a sea of
173	a sequence of
174	a series of
175	a series of ...
176	a set number of
177	a set of
178	a short cut
179	a sign of
180	a slice of flesh
181	a small amount of ...
182	a small portion of
183	a string of
184	a television show
185	a variety of
186	a vast stretch of ...
187	a way out of sth.
188	a wealth of
189	a wedding ring
190	a welcome visitor
191	a wide range of
192	a wolf in sheep's clothing
193	a world of
194	a (an)
195	a(n)
196	a, an
197	A.D.
198	a.m.
199	A.M.
200	a/an
201	aachoo
202	aah
203	aargh
204	Aaron
205	abacus
206	abandon
207	abandoned
208	abbreviation
209	abduct
210	Abigail
211	ability
212	able
213	able-bodied
214	abnormal
215	aboard
216	abolish
217	abolition
218	aboriginal
219	aborigine
220	Aborigine
221	abortion
222	about
223	about ... away from
224	above
225	above all
226	above the level of the sea
227	abracadabra
228	abroad
229	abrupt
230	abruptly
231	abseil
232	absence
233	absent
234	absent-minded
235	absolute
236	absolutely
237	absorb
238	absorption
239	abstain
240	abstract
241	absurd
242	abundant
243	abuse
244	abuser
245	AC adapter
246	academic
247	academy
248	Academy of Arts
249	accelerate
250	acceleration
251	accent
252	accept
253	acceptable
254	acceptance
255	access
256	access time
257	accessibility
258	accessible
259	accessory
260	accident
261	accidental
262	accidentally
263	accommodate
264	accommodation
265	accompany
266	accompany sb. to (a place)
267	accomplish
268	accomplishment
269	according to
270	account
271	account for
272	accountancy
273	accountant
274	accredit
275	accumulate
276	accumulation
277	accuracy
278	accurate
279	accurately
280	accusation
281	accuse
282	accuse ... of
283	accuse sb. of doing sth.
284	accustom
285	accustomed
286	accustomed to
287	ache
288	achieve
289	achieve success
290	achievement
291	aching
292	acid
293	acid rain
294	acknowledge
295	acquaint
296	acquaintance
297	acquire
298	acquisition
299	acre
300	acrobat
301	acrobatics
302	across
303	across from
304	act
305	act ... out
306	act as
307	act like
308	act on
309	act out
310	act sth. out
311	act upon
312	acted
313	acting
314	action
315	action film
316	action movie
317	active
318	active duty
319	actively
320	activist
321	activity
322	actor
323	actress
324	acts of violence
325	actual
326	actually
327	actuate
328	acupuncture
329	acupuncturist
330	acute
331	acute angle
332	ad
333	AD
334	ad writer
335	ad.
336	adapt
337	adapt (to)
338	adapt ... to
339	adapt to
340	adaptable
341	adaptation
342	adapter card
343	add
344	add ... to ...
345	add to
346	add up
347	add up ...
348	addict
349	addicted
350	addicted (to)
351	addicted to
352	addiction
353	addictive
354	adding machine
355	addition
356	additional
357	address
358	Adelaide
359	adequate
360	adjective
361	adjust
362	adjust to
363	adjustment
364	administer
365	administration
366	administrative
367	admirable
368	admiration
369	admire
370	admirer
371	admission
372	admit
373	ado
374	adolescence
375	adolescent
376	adopt
377	adoption
378	adore
379	adult
380	adulthood
381	advance
382	advanced
383	Advanced Research Projects Agency
384	advantage
385	adventure
386	adventurer
387	adventurous
388	advert
389	advertise
390	advertisement
391	advertiser
392	advertising
393	advice
394	advice diamond
395	advisable
396	advise
397	advise ... to do ...
398	advise sb. to do sth.
399	adviser
400	advocate
401	aerobic
402	aerobics
403	aerosol
404	aerospace
405	afar
406	affair
407	affect
408	affectation
409	affected
410	affection
411	affirm
412	afford
413	Afghanistan
414	afraid
415	afraid (of)
416	Africa
417	African
418	African American
419	after
420	after a while
421	after all
422	after class
423	after dark
424	after school
425	after some time
426	after-class
427	afternoon
428	after-school
429	aftershock
430	afterthought
431	afterwards
432	again
433	again and again
434	against
435	against one's will
436	against the rules
437	age
438	agency
439	agenda
440	agent
441	aggression
442	aggressive
443	aggressively
444	Agnes Grey
445	ago
446	agony
447	agree
448	agree on
449	agree to
450	agree with
451	agree with ...
452	agree with sb
453	agree with sb.
454	agreeable
455	agreement
456	agricultural
457	agriculture
458	agriculturist
459	agro-scientific
460	ah
461	aha
462	ahead
463	ahead of
464	ahead of ...
465	Ahmed
466	Ahmed Aziz
467	aid
468	AIDS
469	ailing
470	aim
471	aim (to do something)
472	aim a blow at
473	aim at
474	aim at ...
475	aimless
476	air
477	air conditioner
478	air hostess
479	air mattress
480	air one's view
481	air tank
482	air-conditioned
483	aircraft
484	airfield
485	airline
486	airmail
487	airplane
488	airport
489	airspace
490	aisle
491	Akia
492	Akira Nagata
493	Alabama
494	Alan
495	Alan Turing
496	alarm
497	alarm bell
498	alarm clock
499	alarmed
500	alarming
501	Alaska
502	Albany
503	Albert Einstein
504	Alberta
505	album
506	alcohol
507	alcoholic
508	Aldebaran
509	alert
510	alert sb. to
511	alertly
512	Alex
513	Alexander Graham Bell
514	Alfred
515	algae
516	algebra
517	Alice
518	Alice in Wonderland
519	Alicia
520	alien
521	alike
522	alive
523	all
524	all (the) year round
525	all alone
526	all around
527	all at once
528	all by oneself
529	all day
530	all day and all night
531	all day long
532	all in all
533	all kinds of
534	all kinds of ...
535	all of a sudden
536	all one's life
537	all over
538	all over the world
539	all parts of ...
540	All ready!
541	all right
542	All right.
543	all shapes and sizes
544	all the best
545	all the time
546	all the way
547	all the year round
548	all through one's life
549	all through the night
550	all walks of life
551	all year long
552	all year round
553	Allen
554	allergic
555	alley
556	alligator
557	allocate
558	allow
559	allowance
560	alloy
561	all-round
562	all-time
563	allusion
564	almighty
565	almost
566	alone
567	along
568	along the way
569	along with
570	along with ...
571	alongside
572	aloud
573	alphabet
574	alphabetical
575	Alps
576	already
577	alright
578	also
579	Altamira
580	alter
581	alternate
582	alternate ... and/with ...
583	alternative
584	although
585	altitude
586	altogether
587	ALU
588	aluminium
589	aluminum
590	alumni
591	always
592	am
593	am/is
594	amateur
595	amaze
596	amazed
597	amazement
598	amazing
599	Amazon
600	ambassador
601	ambassadress
602	amber
603	ambiguous
604	ambition
605	ambitious
606	ambulance
607	America
608	American
609	American football
610	American Idol
611	American Standard Code for Information Interchange
612	American Teenager
613	Americanisation
614	America's Got Talent
615	amid
616	among
617	amongst
618	amount
619	amount to
620	amphibian
621	amphibious
622	ample
623	Amsterdam
624	amuse
625	amused
626	amusement
627	amusement park
628	amusing
629	Amy
630	an
631	an aircraft carrier
632	an idea comes to sb.
633	an so on
634	analog
635	analyse
636	analysis
637	analyst
638	analytic
639	analytical
640	ANC
641	ancestor
642	anchor
643	ancient
644	and
645	and so on
646	And you?
647	Andrew Hallidie
648	Andrews
649	android
650	Andy
651	anecdote
652	angel
653	Angel Island
654	anger
655	Angkor Wat
656	angle
657	Angle
658	Anglo-Saxon
659	angrily
660	angry
661	animal
662	Animal Helpline
663	animal sign
664	animal-lover
665	animated
666	animated GIF
667	animation
668	ankle
669	Anna
670	Anna Petrov
671	Anne
672	Anne Sullivan
673	Annie
674	anniversary
675	announce
676	announcement
677	announcer
678	annoy
679	annoyance
680	annoyed
681	annoying
682	annual
683	annual report
684	anonymous
685	another
686	another time
687	answer
688	answer for
689	answering machine
690	ant
691	Antarctic
692	Antarctica
693	antelope
694	anthem
695	anthology
696	anthropologist
697	anti-
698	anti-ageing
699	antibiotic
700	anti-black
701	anticipate
702	anticipation
703	Anti-Japanese War
704	antique
705	anti-smoking
706	antispit
707	anti-venom
708	antivirus program
709	antonym
710	anxiety
711	anxious
712	any
713	any time
714	anybody
715	anyhow
716	anymore
717	anyone
718	anything
719	Anything else?
720	anytime
721	anyway
722	anywhere
723	apart
724	apart from
725	apart from ...
726	apartheid
727	apartment
728	apartment building
729	apartment house
730	Apatosaurus
731	ape
732	aphorism
733	apologise
734	apologize
735	apology
736	apostrophe
737	apparatus
738	apparent
739	apparently
740	appeal
741	appeal to
742	appeal to ...
743	appeal to sb.
744	appealing
745	appear
746	appearance
747	appendage
748	appendicitis
749	appendix
750	appetising
751	appetite
752	appetizer
753	appetizing
754	applaud
755	applause
756	applause of welcome
757	apple
758	apple seed
759	appliance
760	applicable
761	applicant
762	application
763	application software
764	applied
765	Applied Linguistics
766	apply
767	apply for
768	appoint
769	appointed
770	appointment
771	appreciate
772	appreciation
773	appreciative
774	approach
775	approachable
776	appropriate
777	appropriately
778	appropriateness
779	approval
780	approve
781	approve of
782	approve of sth.
783	approx.
784	approximate
785	approximately
786	Apr.
787	April
788	April Fools' Day
789	apron
790	aquarium
791	Arab
792	Arabia
793	Arabic
794	arbitrary
795	arcade
796	arch
797	arch-
798	archaeological
799	archaeologist
800	archaeology
801	archer
802	architect
803	architecture
804	archway
805	Arctic
806	are
807	Are you OK?
808	Are you ready to order?
809	area
810	arena
811	aren't
812	arguable
813	arguably
814	argue
815	argument
816	argumentation
817	arise
818	arise from
819	arithmetic
820	arithmetic logic unit
821	arithmetic operations
822	Arizona
823	arm
824	arm in arm
825	armchair
826	armed
827	armies of
828	Armstrong
829	army
830	Aron Ralston
831	around
832	around the world
833	arouse
834	ARPANET
835	arrange
836	arrange ... in order
837	arranged
838	arrangement
839	array
840	arrest
841	arrival
842	arrive
843	arrive at
844	arrogant
845	arrow
846	arrowhead
847	Arsenal
848	art
849	Art
850	art centre
851	art form
852	art galleries
853	art gallery
854	art room
855	art show
856	artefact
857	Arthur
858	Arthur Conan Doyle
859	article
860	artificial
861	artillery
862	artist
863	artistic
864	as
865	as ... as
866	as ... as ...
867	as ... as possible
868	as ... say
869	as a consequence
870	as a matter of fact
871	as a popular saying goes
872	as a result
873	as a result (of)
874	as a result of
875	as a rule
876	as a whole
877	as early as
878	as easy as pie
879	as far as
880	as far as I know
881	as far as I'm concerned
882	as far as one is concerned
883	as far as we know
884	as fast as
885	as fit as a fiddle
886	as follows
887	as for
888	as good as
889	as if
890	as is known to all
891	as long as
892	as long as ...
893	as many as
894	as much as
895	as often as possible
896	as soon as
897	as soon as possible
898	as soon as sb. can
899	as the weeks went by
900	as things stand
901	as though
902	as time goes by
903	as time goes on
904	as to
905	as usual
906	as well
907	as well as
908	as well as ...
909	as with
910	as/so far as I am concerned
911	ash
912	ashamed
913	ashore
914	Ashrita Furman
915	ashtray
916	Asia
917	Asian
918	aside
919	aside from
920	ask
921	ask ... for ...
922	ask ... for help
923	ask for
924	ask for a ride
925	ask for somebody's hand in marriage
926	ask money for a monument
927	ask permission
928	ask sb. for help
929	ask the way
930	asked
931	asleep
932	asparagus
933	aspect
934	aspirin
935	assault
936	assemble
937	assembly
938	assess
939	assessment
940	asset
941	asset rich but income poor
942	assign
943	assignment
944	assignment sheet
945	assist
946	assistance
947	assistant
948	associate
949	associate ... with ...
950	associate sb./sth. with sb./sth.
951	associate with
952	associated
953	association
954	assume
955	assumption
956	assure
957	asteroid
958	astonish
959	astonished
960	astonishing
961	astonishment
962	astride
963	astrolabe
964	astronaut
965	astronomer
966	astronomy
967	asylum
968	at
969	at ( ... ) intervals
970	at a crossroads
971	at a distance
972	at a higher altitude
973	at a loss
974	at a lower altitude
975	at a quiet corner
976	at a time
977	at a/the speed of
978	at all
979	at all costs
980	at all times
981	at an early age
982	at an end
983	at any rate
984	at best
985	at birth
986	at daybreak
987	at different times
988	at dusk
989	at ease
990	at first
991	at first glance
992	at frst sight
993	at hand
994	at home
995	at its best
996	at last
997	at least
998	at length
999	at liberty
1000	at midnight
1001	at most
1002	at night
1003	at noon
1004	at once
1005	at one's feet
1006	at one's own pace
1007	at other times
1008	at present
1009	at random
1010	at rest
1011	at risk
1012	at risk of
1013	at school
1014	at some time
1015	at somebody's mercy
1016	at someone's command
1017	at stake
1018	at that moment
1019	at that point
1020	at that time
1021	at the age of
1022	at the age of ...
1023	at the back of
1024	at the base of
1025	at the beginning of
1026	at the beginning of ...
1027	at the bottom of
1028	at the bottom of ...
1029	at the close of
1030	at the corner
1031	at the cost of
1032	at the crack of dawn
1033	at the edge of
1034	at the end
1035	at the end of
1036	at the end of ...
1037	at the foot of
1038	at the front
1039	at the head of
1040	at the heart of
1041	at the height of
1042	at the last instant
1043	at the mercy of
1044	at the mercy of ...
1045	at the moment
1046	at the price of
1047	at the same time
1048	at the scene of
1049	at the shopping centre
1050	at the sight of
1051	at the sound of ...
1052	at the speed of
1053	at the start of
1054	at the stroke of midnight
1055	at the time
1056	at the time of ...
1057	at the top of
1058	at the top of ...
1059	at the top of one's voice
1060	at the top of one's voices
1061	at the top of the class
1062	at the turn of
1063	at the very beginning of
1064	at the weekend
1065	at this point
1066	at times
1067	at two minutes to noon
1068	at very short notice
1069	at war
1070	at weekends
1071	at will
1072	at work
1073	at/on weekends
1074	Atalanta
1075	ate
1076	ate ice cream
1077	ate some cotton candy
1078	Athens
1079	athlete
1080	athletic
1081	athletics
1082	atishoo
1083	Atlantic
1084	Atlantic Ocean
1085	atlas
1086	ATM
1087	atmosphere
1088	atom
1089	atomic
1090	atomic bomb
1091	atomic weapon
1092	attach
1093	attach (great) importance to
1094	attach ... to
1095	attach to
1096	attachment
1097	attack
1098	attain
1099	attainment
1100	attempt
1101	attend
1102	attendant
1103	attention
1104	attentively
1105	attentiveness
1106	attic
1107	Atticus
1108	attitude
1109	attract
1110	attract the attention of
1111	attraction
1112	attractive
1113	Auckland
1114	auction
1115	audience
1116	audience handouts
1117	audio
1118	audio input
1119	audio output device
1120	auditorium
1121	auditory
1122	Aug.
1123	augur
1124	August
1125	auld
1126	Auld Lang Syne
1127	aunt
1128	auntie
1129	aural
1130	aurochs
1131	Australia
1132	Australia Day
1133	Australian
1134	Australian football
1135	Austria
1136	Austrian
1137	authentic
1138	author
1139	authority
1140	autobiographical
1141	autobiography
1142	autograph
1143	automatic
1144	automatically
1145	automobile
1146	autonomous
1147	autonomy
1148	autumn
1149	available
1150	avalanche
1151	avenge
1152	avenue
1153	average
1154	avoid
1155	await
1156	awake
1157	awaken
1158	award
1159	award cup
1160	aware
1161	awareness
1162	away
1163	away from home
1164	awesome
1165	awful
1166	awkward
1167	awkwardness
1168	ax
1169	axe
1170	axis
1171	B.C.
1172	baby
1173	baby brother
1174	babysit
1175	baby-sit
1176	bachelor
1177	Bachelor of Arts
1178	bachelor's degree
1179	back
1180	back and forth
1181	back away
1182	back out
1183	back then
1184	back to back
1185	back up
1186	backache
1187	backbone
1188	background
1189	backing track
1190	backpack
1191	backstage
1192	backup
1193	backward
1194	backwards
1195	backyard
1196	bacon
1197	bacteria
1198	bacterium
1199	bad
1200	bad breath
1201	badge
1202	badly
1203	badly off
1204	badminton
1205	bad-tempered
1206	bag
1207	baggage
1208	baggy
1209	Bahmad
1210	bake
1211	baked
1212	baker
1213	bakery
1214	baking
1215	baking soda
1216	balance
1217	balance owing
1218	balanced
1219	balanced diet
1220	balcony
1221	bald
1222	baleen
1223	baleen whale
1224	ball
1225	ballad
1226	ballet
1227	ballet dancer
1228	balloon
1229	balloons
1230	ballot
1231	ballpoint
1232	ballroom
1233	bamboo
1234	bamboo shoot
1235	ban
1236	banana
1237	band
1238	band concert
1239	band director
1240	bandage
1241	bang
1242	Bangladesh
1243	banish
1244	banjo
1245	bank
1246	bank account
1247	banker
1248	banking
1249	bankruptcy
1250	banner
1251	banquet
1252	banyan tree
1253	bar
1254	bar code
1255	bar code scanner
1256	bar graph
1257	barbecue
1258	barber
1259	barbershop
1260	Barcelona
1261	barcode
1262	bare
1263	barely
1264	bargain
1265	bark
1266	bark at
1267	barn
1268	barrel
1269	barrel organ
1270	barren field
1271	barrier
1272	Barry Minto
1273	base
1274	base ... in
1275	base ... on
1276	base on
1277	baseball
1278	baseball and bat
1279	baseball and mitt
1280	baseball bat
1281	baseball card
1282	baseball cards
1283	baseball mitt and ball
1284	baseball player
1285	based
1286	based on ...
1287	basement
1288	basic
1289	basic need
1290	basically
1291	basin
1292	basis
1293	basket
1294	basketball
1295	bat
1296	bath
1297	bathe
1298	bathrobe
1299	bathroom
1300	bathtub
1301	baton
1302	battery
1303	battle
1304	battlefield
1305	bay
1306	bayonet
1307	BBC
1308	BC
1309	be
1310	be (closely) related to sb./sth.
1311	be (very) poor in sth.
1312	be/get tired of
1313	be able to
1314	be absent from
1315	be accused of
1316	be accustomed to
1317	be acknowledged by
1318	be added to
1319	be addressed as
1320	be afraid ...
1321	be afraid of
1322	be afraid of sb./sth.
1323	be afraid to do ...
1324	be afraid to do sth.
1325	be alive with
1326	be all thumbs
1327	be allowed to do sth.
1328	be amazed at ...
1329	be amazed by
1330	be angry with
1331	be angry with sb.
1332	be appropriate for ...
1333	be appropriate to ...
1334	be as accurate as possible
1335	be ashamed of
1336	be ashamed of ...
1337	be ashamed of sb./sth./yourself
1338	be ashamed to do sth.
1339	be at war with
1340	be awakened by sth.
1341	be aware of
1342	be aware of ...
1343	be away
1344	be back
1345	be back on one's feet
1346	be bad for
1347	be based on
1348	be based on ...
1349	be based on/upon
1350	be blessed
1351	be blessed with
1352	be bored with
1353	be born
1354	be born ...
1355	be born into
1356	be born like ...
1357	be born with
1358	be bound to
1359	be burdened with ...
1360	be burnt out
1361	be busy doing ...
1362	be called
1363	be careful
1364	be careful to do sth.
1365	be careful with
1366	Be careful!
1367	be caught in
1368	be caught short
1369	be centred around
1370	be characterized by
1371	be charged with
1372	be chosen as
1373	be clear of
1374	be close to
1375	be close to ...
1376	be close to death
1377	be closely connected to
1378	be closely related to
1379	be compared ... to
1380	be composed of
1381	be concerned about
1382	be concerned about sb./sth.
1383	be concerned about sth.
1384	be concerned with
1385	be condemned as
1386	be condemned to something
1387	be confident in
1388	be connected to
1389	be connected with
1390	be considered as
1391	be convenient for
1392	be convenient for ...
1393	be covered in a curtain
1394	be covered with
1395	be covered with ...
1396	be covered with/by
1397	be crazy about
1398	be crazy about/on sb./sth.
1399	be dedicated to
1400	be delighted to
1401	be detached from
1402	be determined to
1403	be devoted to
1404	be different from
1405	be different from ...
1406	be divided into
1407	be divided into sth.
1408	be dying to (do something)
1409	be economical with the truth
1410	be elected as
1411	be endangered
1412	be envious of
1413	be equal in
1414	be equal to
1415	be equipped with
1416	be equivalent to
1417	be exposed to
1418	be famous as
1419	be famous for
1420	be fascinated by
1421	be featured by
1422	be filled with
1423	be filled with ...
1424	be flushed with
1425	be fond of
1426	be forced to (do something)
1427	be forced to do sth.
1428	be forced to leave for
1429	be fortunate in ...
1430	be fresh from
1431	be friends with sb.
1432	be from
1433	be from ...
1434	be full of
1435	be full of ...
1436	be fully aware of
1437	be gifted with
1438	be going to
1439	be good at
1440	be good at ...
1441	be good for
1442	be good with ...
1443	be grateful to
1444	be great at
1445	be hard of hearing
1446	be hard on
1447	be hard on sb.
1448	be hard on/upon sb.
1449	be harmful to
1450	be harmful to ...
1451	be heavy with
1452	be helpful to ...
1453	be home to
1454	be honoured for
1455	be impressed by
1456	be impressed with
1457	be in (great) danger
1458	be in control (of something)
1459	be in control of
1460	be in hot water
1461	be in keeping with ...
1462	be in love with
1463	be in trouble
1464	be in want of
1465	be in with a chance
1466	be inclined to ...
1467	be indifferent to
1468	be intended to be
1469	be intended to do something
1470	be interested in
1471	be interested in ...
1472	be interested in doing ...
1473	be interested in doing sth.
1474	be involved in
1475	be keen on
1476	be kind to sb./sth.
1477	be known as
1478	be known as ...
1479	be known for
1480	be known for ...
1481	be lacking in sth.
1482	be late for
1483	be likely to
1484	be likely to (do something)
1485	be likely to do
1486	be likely to do sth.
1487	be linked to
1488	be made into
1489	be made of
1490	be made of ...
1491	be made up of
1492	be meant to
1493	be modelled after
1494	be moved to tears
1495	be named after
1496	be necessary for ...
1497	be new to
1498	be nice to ...
1499	be obsessed with
1500	be occupied with
1501	be of help
1502	be of sb's age
1503	be off to
1504	be off to ...
1505	be on
1506	be on edge
1507	be on good terms with
1508	be on the move
1509	be opposed to
1510	be out of service
1511	be perfect in sth.
1512	be pleased to
1513	be pleased with ...
1514	be popular with
1515	be prepared to
1516	be prepared to do something
1517	be proud of
1518	be proud of ...
1519	be proud of sb./sth.
1520	be puzzled
1521	be quick to
1522	Be quiet.
1523	be ready to
1524	be ready to ...
1525	be regarded as
1526	be related to
1527	be replaced by
1528	be replaced with
1529	be representative of
1530	be responsible for
1531	be rich in ...
1532	be rooted in
1533	be rude to
1534	be satisfied with
1535	be scared about sth.
1536	be scared of
1537	be selected as
1538	be sensitive to
1539	be sentenced to
1540	be shocked at
1541	be short for
1542	be short for sth.
1543	be short of
1544	be similar in sth.
1545	be similar to
1546	be skilled at
1547	be strict (with sb)
1548	be strict (with sb.)
1549	be strict with
1550	be strict with sb
1551	be supposed to
1552	be supposed to do
1553	be sure about
1554	be sure of
1555	be sure to
1556	be surprised at
1557	be surprised to ...
1558	be taken prisoner
1559	be thankful for
1560	be thankful to sb.
1561	be the same as
1562	be thirsty for
1563	be thought to be
1564	be through with
1565	be tired out
1566	be to blame (for something)
1567	be tolerant of sb./sth.
1568	be unable to ...
1569	be unaware of
1570	be under arrest
1571	be unfamiliar with
1572	be unsure of
1573	be up to
1574	be up to ...
1575	be upright and just
1576	be used to
1577	be used to do
1578	be viewed as
1579	be well known for ...
1580	be well-known for
1581	be widely used in ...
1582	be willing to
1583	be willing to (do something)
1584	be with somebody
1585	be worried about
1586	be worth doing sth
1587	be wrapped in
1588	be/feel in the mood (for sth./to do sth.)
1589	be/get familiar with
1590	be/get lost
1591	be/get stuck in
1592	be/get used to
1593	beach
1594	beachfront
1595	bead
1596	beak
1597	bean
1598	bean curd
1599	bean paste
1600	beans
1601	bear
1602	bear in mind
1603	bear market
1604	bearable
1605	beard
1606	bearded
1607	bearer
1608	bearing circle
1609	beast
1610	beat
1611	beat on
1612	beat time
1613	beaten track
1614	beautiful
1615	beautifully
1616	beauty
1617	beaver
1618	became
1619	because
1620	because of
1621	Becky
1622	become
1623	become (extremely) critical of ...
1624	become accustomed to
1625	become addicted to
1626	become aware (of/that ... )
1627	become aware of sth.
1628	become content with ...
1629	become engaged to
1630	become engaged to somebody
1631	become ill
1632	become interested in
1633	become known (as)
1634	become known as ...
1635	become of
1636	become second nature
1637	become/be aware of
1638	bed
1639	bed time
1640	bedding
1641	bedecked
1642	bedroom
1643	bedside
1644	bedtime
1645	bee
1646	beef
1647	beef up
1648	beefsteak
1649	beehive
1650	beekeeper
1651	been
1652	beep
1653	beeper
1654	beer
1655	beetle
1656	before
1657	before long
1658	befriend
1659	beg
1660	beg for
1661	began
1662	beggar
1663	begin
1664	begin with
1665	begin with ...
1666	beginner
1667	beginning
1668	behalf
1669	behave
1670	behave oneself
1671	behavior
1672	behaviour
1673	behind
1674	beholder
1675	Beijing International School
1676	Beijing Opera
1677	being
1678	Belgium
1679	belief
1680	believable
1681	believe
1682	believe in
1683	believe in oneself
1684	believe it or not
1685	believe strongly in
1686	believed
1687	believer
1688	bell
1689	bellboy
1690	belly
1691	belong
1692	belong to
1693	belong to ...
1694	belongings
1695	beloved
1696	below
1697	below zero
1698	belt
1699	Ben
1700	bench
1701	bend
1702	bend down
1703	bend over ...
1704	beneath
1705	beneficial
1706	benefit
1707	benefit from ...
1708	bent
1709	bent on (doing) something
1710	beret
1711	Bering Strait
1712	Berlin
1713	Bert
1714	beside
1715	besides
1716	best
1717	best man
1718	best of all
1719	best seller
1720	best wishes
1721	best wishes to ...
1722	best-known
1723	bestride
1724	best-seller
1725	best-selling
1726	bet
1727	betray
1728	Betsy Trotwood
1729	better
1730	better and better
1731	between
1732	between ... and ...
1733	beverage
1734	beware
1735	beyond
1736	beyond a doubt
1737	beyond doubt
1738	beyond one's control
1739	beyond one's means
1740	beyond question
1741	beyond repair
1742	beyond the reach of
1743	beyond words
1744	Bible
1745	biblical
1746	bicycle
1747	bid
1748	bid ... goodbye
1749	big
1750	Big Bang
1751	Big Ben
1752	big deal
1753	big name
1754	big sales
1755	big wheel
1756	Bigfoot
1757	bigger
1758	biggest
1759	big-ticket
1760	bike
1761	bike ride
1762	bilingual
1763	bill
1764	Bill
1765	billboard
1766	billion
1767	billionaire
1768	billions of
1769	billow
1770	Billy
1771	billy-goat
1772	bin
1773	binary digit
1774	binary system
1775	bind
1776	binding
1777	bingo
1778	binoculars
1779	biochemist
1780	biochemistry
1781	biodiversity
1782	biogas
1783	biographer
1784	biography
1785	bioinformatician
1786	biological
1787	biologist
1788	biology
1789	biotechnology
1790	bird
1791	bird flu
1792	birdcage
1793	birds
1794	Bird's Nest
1795	birdwatching
1796	bird-watching
1797	birth
1798	birthday
1799	birthday cake
1800	birthplace
1801	biscuit
1802	bishop
1803	bison
1804	bit
1805	bit depth
1806	bite
1807	bite into
1808	bits and pieces
1809	bitter
1810	bitterly
1811	bitterness
1812	black
1813	black eye
1814	black rhino
1815	black tea
1816	black-and-white
1817	blackboard
1818	blacken
1819	blackout
1820	blacksmith
1821	blade
1822	blame
1823	blame ... on ...
1824	blank
1825	blanket
1826	blankness
1827	blast
1828	blast off
1829	blazer
1830	blazing
1831	bleak
1832	bleed
1833	blend
1834	blend ... with
1835	blender
1836	bless
1837	Bless you!
1838	blessing
1839	blind
1840	blindness
1841	blink
1842	bliss
1843	blister
1844	blistering
1845	block
1846	block out
1847	blockbuster
1848	blog
1849	blond
1850	blonde
1851	blood
1852	blood pressure
1853	blood sugar
1854	bloody
1855	bloom
1856	blossom
1857	blouse
1858	blow
1859	blow a kiss
1860	blow off
1861	blow out
1862	blow out(candles)
1863	blow up
1864	blow-hole
1865	blue
1866	'blue chip' share
1867	blue jeans
1868	blue ribbon
1869	blue whale
1870	bluegrass music
1871	blueprint
1872	blues
1873	Bluetooth™
1874	bluntly
1875	blush
1876	boar
1877	board
1878	board game
1879	boarding
1880	boarding school
1881	boastful
1882	boat
1883	boating
1884	boatman
1885	Bob
1886	bobwhite
1887	body
1888	body count
1889	body language
1890	body language for "listen"
1891	body language for "quiet"
1892	boil
1893	boiled water
1894	boiling
1895	boiling water
1896	bold
1897	boldest
1898	bolt
1899	bomb
1900	bond
1901	bone
1902	bonfire
1903	bonnie
1904	bonus
1905	bony
1906	book
1907	book bag
1908	book of world records
1909	book review
1910	bookcase
1911	booklet
1912	bookshop
1913	bookstore
1914	bookworm
1915	boom
1916	boomerang
1917	booming
1918	boost
1919	boot
1920	boot up
1921	booth
1922	booting
1923	boots
1924	border
1925	bore
1926	bored
1927	boredom
1928	boring
1929	born
1930	born to
1931	borough
1932	borrow
1933	borrow ... from
1934	borrow ... from ...
1935	borrow a book
1936	borrow from
1937	bosom
1938	Bosphorous
1939	boss
1940	Boston
1941	botanical
1942	botanical garden
1943	botanist
1944	botany
1945	both
1946	both ... and ...
1947	bother
1948	bottle
1949	bottled
1950	bottom
1951	bought
1952	bought some gifts
1953	boulevard
1954	bounce
1955	bouncing(a ball)
1956	bound
1957	-bound
1958	boundary
1959	boundlessness
1960	bouquet
1961	bow
1962	bow and arrow
1963	bow tie
1964	bow wow
1965	bowl
1966	bowling
1967	bow-wow
1968	box
1969	box office
1970	boxer
1971	boxing
1972	Boxing Day
1973	boy
1974	boycott
1975	boyhood
1976	brace
1977	bracelet
1978	braces
1979	brag
1980	brag about
1981	braid
1982	brain
1983	brain damage
1984	brain drain
1985	brainstorm
1986	brake
1987	branch
1988	brand
1989	brand new
1990	brand-new
1991	brandy
1992	brass
1993	brave
1994	bravery
1995	Brazil
1996	Brazilian
1997	bread
1998	bread maker
1999	breadfruit
2000	break
2001	break (a dish)
2002	break ... record
2003	break a record
2004	break away
2005	break away (from)
2006	break away from
2007	break down
2008	break into
2009	break new ground
2010	break off
2011	break out
2012	break out in blossom
2013	break sb. down
2014	break the ice
2015	break the record
2016	break up
2017	breakable
2018	breakdance
2019	breakdown
2020	breakfast
2021	breakthrough
2022	breast
2023	breath
2024	breathable
2025	breathe
2026	breathing
2027	breathless
2028	breathlessly
2029	breathtaking
2030	breed
2031	breeding
2032	breeze
2033	brewery
2034	Brian
2035	bribery
2036	brick
2037	'bricks and mortar' investment
2038	bride
2039	bridegroom
2040	bridesmaid
2041	bridge
2042	brief
2043	briefcase
2044	briefly
2045	brigand
2046	bright
2047	bright-coloured
2048	brighten
2049	brightly
2050	brightly-lit
2051	brightness
2052	brilliance
2053	brilliant
2054	brimful
2055	bring
2056	bring ... back to life
2057	bring ... to an end
2058	bring ... to mind
2059	bring about
2060	bring along
2061	bring an end to
2062	bring back
2063	bring back to life
2064	bring down
2065	bring good luck to ...
2066	bring mail
2067	bring on
2068	bring out
2069	bring somebody to justice
2070	bring somebody to safety
2071	bring sth. on sb.
2072	bring sth. to the attention of sb.
2073	bring up
2074	brink
2075	brisk
2076	bristlecone pine tree
2077	Brit
2078	Britain
2079	British
2080	broad
2081	broadband
2082	broadcast
2083	broadcasting
2084	broaden
2085	broccoli
2086	brochure
2087	broke
2088	broken
2089	broken heart
2090	broken leg
2091	broken-winged
2092	bronchitis
2093	bronze
2094	bronze ware
2095	broom
2096	brother
2097	brother and sister
2098	brotherhood
2099	brothers
2100	brought
2101	brown
2102	Brown
2103	browse
2104	browser
2105	Bruce Lee
2106	bruise
2107	brunch
2108	Brunei
2109	brush
2110	brush (my) teeth
2111	brush (your) teeth
2112	brush ... teeth
2113	brush one's teeth
2114	brush sth. off sth.
2115	brush strokes
2116	brutal
2117	bubble
2118	bucket
2119	bucket and shovel
2120	Buckingham Palace
2121	bud
2122	Buddha
2123	Buddhism
2124	Buddhist
2125	budding
2126	buddy
2127	budget
2128	budgie
2129	buffalo
2130	buffet
2131	Buford
2132	bug
2133	build
2134	build on
2135	build sb. up
2136	build up
2137	builder
2138	building
2139	building block
2140	built
2141	built-in
2142	bulb
2143	bulky
2144	bull
2145	bull market
2146	bullet
2147	bulletin
2148	bulletproof
2149	bullheaded
2150	bully
2151	bump
2152	bump into
2153	bump into someone
2154	bumper car
2155	bun
2156	bunch
2157	bunch of
2158	Bund
2159	bungalow
2160	bungee jumping
2161	bunny
2162	burden
2163	bureau
2164	bureaucratic
2165	burger
2166	burglar
2167	burglary
2168	Burgundy
2169	burial
2170	Burma
2171	burn
2172	burn (the soup)
2173	burn down
2174	burn one's bridges
2175	burn out
2176	burn to the ground
2177	burning
2178	burst
2179	burst in
2180	burst into
2181	burst into ...
2182	burst into laughter
2183	burst into tears
2184	burst on the scene
2185	burst out
2186	burst out laughing
2187	burst through
2188	burst upon
2189	bury
2190	bury oneself in
2191	bus
2192	bus driver
2193	bus station
2194	bus stop
2195	bush
2196	bushfire
2197	business
2198	business card
2199	business venture
2200	businessman
2201	businesswoman
2202	busy
2203	but
2204	butcher
2205	butter
2206	butterfly
2207	button
2208	buy
2209	buy an ice cream
2210	buy toys
2211	buzzword
2212	by
2213	by ...
2214	by accident
2215	by all means
2216	by and by
2217	by bad ways
2218	by bike
2219	by boat
2220	by bus
2221	by car
2222	by chance
2223	by coincidence
2224	by hand
2225	by heart
2226	by law
2227	by means of
2228	by means of ...
2229	by mistake
2230	by name
2231	by no means
2232	by oneself
2233	by peaceful means
2234	by plane
2235	by school bus
2236	by ship
2237	by subway
2238	by taxi
2239	by the dozen
2240	by the end of
2241	by the end of ...
2242	by the skin of one's teeth
2243	by the time
2244	by the time ...
2245	by the way
2246	by the year
2247	by train
2248	bye
2249	bye-bye
2250	byproduct
2251	by-product
2252	byte
2253	cab
2254	cabbage
2255	cabbages
2256	cabin
2257	cabinet
2258	cable
2259	cable car
2260	cable modem
2261	cable TV
2262	cache
2263	cactus
2264	cafe
2265	café
2266	cafeteria
2267	caffeine
2268	cage
2269	caiman
2270	Cairo
2271	Caius
2272	cake
2273	calcium
2274	calculate
2275	calculation
2276	calculator
2277	calendar
2278	calf
2279	Calgary
2280	Cali
2281	California
2282	Californian
2283	call
2284	call (sb) back
2285	call (sb.) back
2286	call for
2287	call for ...
2288	call for an end to sth
2289	call for one's attention
2290	call in
2291	call off
2292	call off an appointment
2293	call on
2294	call out
2295	call sb back
2296	call to
2297	call up
2298	call upon sb. to do sth.
2299	call(my)friend
2300	called
2301	calligraphy
2302	calm
2303	calm ( ... ) down
2304	calm down
2305	calmly
2306	CAM
2307	Cambodia
2308	Cambodian
2309	Cambridge Street
2310	came
2311	camel
2312	Camelot Park
2313	camera
2314	cameraman
2315	camouflage
2316	camp
2317	camp out
2318	campaign
2319	camper
2320	camper van
2321	campfire
2322	camping
2323	campsite
2324	campus
2325	can
2326	Can I ...?
2327	Can I help you?
2328	can of
2329	can opener
2330	Can you tell me the way to ...?
2331	Canada
2332	Canadian
2333	canal
2334	Canberra
2335	cancel
2336	cancel out
2337	cancer
2338	candidate
2339	candies
2340	candle
2341	candy
2342	Candy
2343	cannabis
2344	cannibal
2345	cannot
2346	cannot help but ...
2347	cannot help but do sth.
2348	canoe
2349	can't
2350	can't help but do something
2351	can't help doing something
2352	can't help doing sth.
2353	can't stand
2354	can't wait
2355	can't wait to (do sth.)
2356	can't wait to do
2357	can't wait to do something
2358	can't wait to do sth.
2359	canteen
2360	Cantonese
2361	canvas
2362	canyon
2363	cap
2364	capability
2365	capable
2366	capacity
2367	Cape Town
2368	caper
2369	capital
2370	capital gain
2371	capital investment
2372	capital punishment
2373	capsulate
2374	capsule
2375	captain
2376	Captain Bligh
2377	caption
2378	capture
2379	car
2380	car museum
2381	car park
2382	car pool
2383	car wash
2384	carbine
2385	carbohydrate
2386	carbon
2387	carbon dioxide
2388	carbon monoxide
2389	carcinogen
2390	card
2391	cardboard
2392	cardigan
2393	care
2394	care about
2395	care for
2396	career
2397	carefree
2398	careful
2399	carefully
2400	careless
2401	carelessly
2402	carelessness
2403	cargo
2404	caring
2405	Carl
2406	Carla
2407	Carmen
2408	carnival
2409	Carnival
2410	carol
2411	Carol
2412	Caroline
2413	carpenter
2414	carpet
2415	carriage
2416	carried
2417	carrier
2418	carrot
2419	carrots
2420	carry
2421	carry off
2422	carry on
2423	carry on (with) ...
2424	carry out
2425	cart
2426	cartilage
2427	carton
2428	carton of
2429	cartoon
2430	cartoonist
2431	cartoons
2432	carve
2433	carving
2434	case
2435	case study
2436	Casey
2437	cash
2438	cash a cheque
2439	cash crop
2440	cash in
2441	cash register
2442	cashier
2443	cassette
2444	cast
2445	cast a glance at
2446	cast about
2447	cast down
2448	cast sb./sth. aside
2449	cast-iron
2450	castle
2451	casual
2452	casual employee
2453	casually
2454	cat
2455	catalogue
2456	catalogue shopping
2457	catastrophe
2458	catch
2459	catch a cold
2460	catch a disease
2461	catch a glimpse of
2462	catch fire
2463	catch on
2464	catch one's attention
2465	catch one's eye
2466	catch sight of
2467	catch sight of ...
2468	catch somebody off his guard
2469	catch up
2470	catch up on
2471	catch-22
2472	catching
2473	catching (a ball)
2474	catchy
2475	category
2476	cater
2477	cater for
2478	cater for sb/sth
2479	cater to
2480	cater to somebody/something
2481	cater (to)
2482	catering
2483	catfish
2484	cathedral
2485	Catherine II
2486	cathode-ray tube
2487	Catholic
2488	Cathy
2489	cattle
2490	catwalk
2491	caught
2492	cause
2493	caution
2494	cautious
2495	cave
2496	caveman
2497	CBA
2498	CBRC
2499	CCTV
2500	CD
2501	CD player
2502	CD recorder
2503	CD-R
2504	CD-R drive
2505	CD-ROM
2506	CD-ROM drive
2507	CD-RW
2508	CD-RW drive
2509	cease
2510	cease to be
2511	ceiling
2512	celebrate
2513	celebrated
2514	celebration
2515	celebrity
2516	celery
2517	celestial
2518	cell
2519	cellist
2520	cello
2521	cellphone
2522	Celsius
2523	Celtic
2524	cement
2525	cemetery
2526	cent
2527	centenary
2528	centennial
2529	center
2530	centigrade
2531	centimeter
2532	centimetre
2533	central
2534	Central America
2535	Central Asia
2536	central heating
2537	Central Park
2538	central processing unit
2539	centralise
2540	centre
2541	centre round/on/upon
2542	century
2543	cereal
2544	ceremonial
2545	ceremony
2546	certain
2547	certainly
2548	certainty
2549	certificate
2550	certificated
2551	CFC
2552	chain
2553	chain store
2554	chair
2555	chairman
2556	chairperson
2557	chalk
2558	challenge
2559	challenge ... to ...
2560	challenging
2561	chamber
2562	chameleon
2563	champagne
2564	champion
2565	championship
2566	chance
2567	change
2568	change for the better
2569	change into
2570	change one's attitude towards sb./sth.
2571	change one's mind
2572	change with the times
2573	changeable
2574	changed
2575	channel
2576	chant
2577	chaos
2578	chap
2579	chapel
2580	chapter
2581	char
2582	character
2583	characteristic
2584	characterize
2585	charcoal
2586	charge
2587	chariot
2588	charity
2589	Charles Babbage
2590	Charles Dickens
2591	Charles Keeling
2592	Charlie Chaplin
2593	Charlotte Bronte
2594	charm
2595	charming
2596	chart
2597	charter
2598	chase
2599	chat
2600	chat client
2601	chat room
2602	chat show
2603	chatter
2604	chauffeur
2605	cheap
2606	cheaply
2607	cheat
2608	cheating
2609	check
2610	check in
2611	check in (at)
2612	check out
2613	checked
2614	checklist
2615	checkout
2616	check-up
2617	cheek
2618	cheekbone
2619	cheer
2620	cheer ... on
2621	cheer ... up
2622	cheer for
2623	cheer sb. up
2624	cheer somebody up
2625	cheer up
2626	cheerful
2627	cheerleader
2628	cheerleading
2629	cheers
2630	cheese
2631	cheeseburger
2632	cheetah
2633	chef
2634	chef's hat
2635	chemical
2636	chemist
2637	chemistry
2638	Chengdu Research Base
2639	cheongsam
2640	cheque
2641	cherries
2642	cherry
2643	chess
2644	chess pieces
2645	chessboard
2646	chest
2647	chew
2648	chewing gum
2649	Chiang Mai
2650	Chiapas
2651	Chicago
2652	chick
2653	chicken
2654	chief
2655	chief editor
2656	child
2657	childhood
2658	childish
2659	children
2660	Children's Day
2661	Children's Palace
2662	Chile
2663	chili
2664	chill
2665	chilled
2666	chilli
2667	chilly
2668	chime
2669	chimney
2670	chimp
2671	chimpanzee
2672	chin
2673	china
2674	China
2675	China Stock Exchange
2676	China Welfare Institute
2677	China's Got Talent
2678	Chinatown
2679	Chinese
2680	Chinese book
2681	Chinese chess
2682	Chinese fancy knots
2683	Chinese ink painting
2684	Chinese knot
2685	Chinese leaves
2686	Chinese New Year
2687	Chinese New Year's Day
2688	Chinese New Year's Eve
2689	Chinese opera
2690	Chinese paper-cutting
2691	chip
2692	Chip Taylor
2693	chips
2694	chocolate
2695	choice
2696	choir
2697	choke
2698	cholera
2699	Chongyang Festival
2700	choose
2701	chop
2702	chop off
2703	chopstick
2704	chopsticks
2705	choral
2706	chore
2707	chorus
2708	chose
2709	Christ
2710	Christchurch
2711	Christian
2712	Christianity
2713	Christmas
2714	Christmas Day
2715	Christmas Eve
2716	Christmas tree
2717	Christopher Columbus
2718	chrysanthemum
2719	chubby
2720	chuckle
2721	chug
2722	chunk
2723	church
2724	cigar
2725	cigarette
2726	cigarette lighter
2727	Cinderella
2728	Cindy
2729	cinema
2730	cinquain
2731	Circe
2732	circle
2733	circle of life
2734	circuit
2735	circular
2736	circulate
2737	circulation
2738	circumspection
2739	circumstance
2740	circumstances
2741	circus
2742	citizen
2743	citizenship
2744	city
2745	City Mouse
2746	City Square
2747	civil
2748	civil engineering
2749	Civil War
2750	civilian
2751	civilisation
2752	civilization
2753	civilized
2754	claim
2755	Claire
2756	clam
2757	Clancy
2758	clank
2759	clap
2760	clapping game
2761	Clara
2762	clarify
2763	clarity
2764	Clark
2765	clash
2766	class
2767	classic
2768	classical
2769	classify
2770	classmate
2771	classroom
2772	Claudia
2773	claw
2774	clay
2775	clean
2776	clean (my) room
2777	clean (up)
2778	clean ... off
2779	clean my room
2780	clean off
2781	clean the room
2782	clean up
2783	cleaned
2784	cleaned the window
2785	cleaner
2786	cleaning the room
2787	cleanup
2788	clean-up
2789	clear
2790	clear one's throat
2791	clear out
2792	clearly
2793	clergyman
2794	clerk
2795	clever
2796	cleverly
2797	cliché
2798	click
2799	client
2800	client operating systems
2801	cliff
2802	climate
2803	climax
2804	climb
2805	climb a hill
2806	climb on the window ledge
2807	climb trees
2808	climb up
2809	climb up onto ...
2810	climbed
2811	climbed a hill
2812	climber
2813	climbing
2814	clinch
2815	cling
2816	cling (to something)
2817	clinic
2818	clip
2819	clipboard
2820	clip-clop
2821	cloakroom
2822	clock
2823	clock cycle
2824	clock speed
2825	clockwork
2826	clod
2827	clone
2828	close
2829	close by
2830	close down
2831	close to
2832	close to ...
2833	close up
2834	Close your book.
2835	closed
2836	closely
2837	closet
2838	close-up
2839	cloth
2840	clothes
2841	clothes hanger
2842	clothing
2843	cloud
2844	cloudy
2845	clown
2846	club
2847	clue
2848	clump
2849	clumsily
2850	clumsy
2851	clutch
2852	cm
2853	coach
2854	coachman
2855	coal
2856	coarse
2857	coast
2858	coastal
2859	coastguard
2860	coastline
2861	coat
2862	coat with rocks
2863	co-author
2864	cobbled
2865	cocaine
2866	cockney
2867	cockroach
2868	cocoa
2869	coconut
2870	code
2871	coffee
2872	coffeemaker
2873	coffin
2874	co-founder
2875	coin
2876	coincidence
2877	coins
2878	coke
2879	Coke
2880	cola
2881	cold
2882	cold boot
2883	cold-colored
2884	collaboration
2885	collapse
2886	collar
2887	colleague
2888	collect
2889	collected
2890	collecting erasers
2891	collection
2892	college
2893	collision
2894	collision course
2895	Colobus monkey
2896	Colombia
2897	colonel
2898	colonial
2899	colonist
2900	colonize
2901	colony
2902	color
2903	color depth
2904	colorful
2905	coloring
2906	Colosseum
2907	colour
2908	coloured
2909	colourful
2910	Columbus Day
2911	column
2912	coma
2913	comb
2914	comb (my) hair
2915	comb (through) something (for)
2916	combat
2917	combination
2918	combine
2919	combine ... and ...
2920	combine ... with ...
2921	combine sth. with sth.
2922	come
2923	come a long way
2924	come about
2925	come across
2926	come along
2927	come back
2928	come back to life
2929	come by
2930	come down
2931	come down with
2932	come forward
2933	come from
2934	come from ...
2935	come from sth.
2936	Come here.
2937	come in
2938	come in last
2939	come into being
2940	come into contact with
2941	come into existence
2942	come into one's mind
2943	come into view
2944	come of age
2945	come off it
2946	come on
2947	Come on!
2948	Come on.
2949	come out
2950	come out of
2951	come over
2952	come over (to ... )
2953	come round
2954	come straight to the point
2955	come to
2956	come to a solution
2957	come to a stop
2958	come to an end
2959	come to do something
2960	come to life
2961	come to one's aid
2962	come to one's rescue
2963	come to power
2964	come to school
2965	come to tea
2966	come to the conclusion
2967	come to the fore
2968	come true
2969	come up
2970	come up to
2971	come up with
2972	comedian
2973	comedy
2974	comet
2975	comfort
2976	comfortable
2977	comfortably
2978	comforts
2979	comic
2980	comic book
2981	comic strip
2982	coming
2983	comma
2984	command
2985	command of
2986	commander
2987	commanding
2988	command-line interface
2989	commemorate
2990	commendation
2991	comment
2992	commentary
2993	commentator
2994	commercial
2995	commercial advertisement
2996	commit
2997	commit crimes
2998	commit suicide
2999	commitment
3000	committed
3001	committee
3002	common
3003	commonly
3004	commonplace
3005	Commonwealth
3006	communicate
3007	communicate with
3008	communicate with ...
3009	communication
3010	communications
3011	communications device
3012	communications satellite
3013	communism
3014	communist
3015	community
3016	compact disc read-only memory
3017	compact disc-recordable
3018	compact disc-rewritable
3019	CompactFlash
3020	companion
3021	companionship
3022	company
3023	comparable
3024	compare
3025	compare ... to
3026	compare ... to ...
3027	compare ... with
3028	compare ... with ...
3029	compare to/with
3030	compare with
3031	compared with
3032	compared with ...
3033	comparison
3034	comparison operations
3035	compass
3036	compassion
3037	compel
3038	compensate
3039	compensatory
3040	compete
3041	compete against ...
3042	compete for
3043	competence
3044	competent
3045	competition
3046	competitive
3047	competitor
3048	compile
3049	complain
3050	complain about
3051	complain about sb./sth.
3052	complain of
3053	complaint
3054	complementary metal-oxide semiconductor
3055	complete
3056	completely
3057	completion
3058	complex
3059	complex sentence
3060	complexion
3061	complexity
3062	complicated
3063	complication
3064	compliment
3065	component
3066	compose
3067	compose music
3068	composed
3069	composer
3070	composite
3071	composition
3072	compost
3073	compound sentence
3074	comprehend
3075	comprehending
3076	comprehension
3077	comprehensive
3078	compress
3079	compromise
3080	compulsive
3081	compulsory
3082	computer
3083	computer class
3084	computer game
3085	computer lab
3086	computer literacy
3087	computer operator
3088	computer output microfilm recorder
3089	computer programmer
3090	computer room
3091	computer specialist
3092	computer studies
3093	Computer Studies
3094	computer-aided manufacturing
3095	computer-based training
3096	computerise
3097	comrade
3098	conceal
3099	concede
3100	conceive
3101	concentrate
3102	concentrate on
3103	concentration
3104	concept
3105	conception
3106	concern
3107	concerned
3108	concerned (about)
3109	concerning
3110	concert
3111	concert hall
3112	concession
3113	concise
3114	conclude
3115	conclusion
3116	concrete
3117	concubine
3118	condemn
3119	condescend
3120	condition
3121	conditioner
3122	condom
3123	condor
3124	conduct
3125	conductor
3126	cone
3127	confederation
3128	confer
3129	conference
3130	confess
3131	confess to
3132	confidence
3133	confident
3134	confidential
3135	confidently
3136	confine
3137	confine ... to ...
3138	confirm
3139	confirmation
3140	confirmed
3141	confiscate
3142	conflict
3143	conflicted
3144	conform
3145	confront
3146	confuse
3147	confused
3148	confusing
3149	confusion
3150	confute
3151	congestion
3152	congratulate
3153	congratulation
3154	congratulations
3155	congress
3156	connect
3157	connect ... with
3158	connect ... with ...
3159	connect to/with
3160	connect with
3161	connection
3162	connector
3163	conquer
3164	conscience
3165	conscious
3166	consciousness
3167	consecrate
3168	consecutive
3169	consensus
3170	consequence
3171	consequently
3172	conservation
3173	conservationist
3174	conservative
3175	conservatory
3176	consider
3177	consider oneself as a failure
3178	considerable
3179	considerably
3180	considerate
3181	consideration
3182	considering
3183	consist
3184	consist of
3185	consist of sth.
3186	consistent
3187	consistent with
3188	consolidate
3189	constant
3190	constantly
3191	constitution
3192	constitutional
3193	constraint
3194	construct
3195	construction
3196	constructive
3197	consult
3198	consultant
3199	consultation
3200	consume
3201	consumer
3202	consumption
3203	contact
3204	contain
3205	container
3206	contemporary
3207	content
3208	contest
3209	contestant
3210	context
3211	continent
3212	continental
3213	continental shelf
3214	continual
3215	continually
3216	continue
3217	continue doing ...
3218	continuing
3219	continuous
3220	continuously
3221	contract
3222	contradict
3223	contradiction
3224	contradictory
3225	contrary
3226	contrast
3227	contrast with
3228	contribute
3229	contribute to
3230	contribute to ...
3231	contribution
3232	control
3233	control unit
3234	controller
3235	controversial
3236	controversy
3237	convenience
3238	convenience store
3239	convenient
3240	convention
3241	conventional
3242	conversation
3243	conversational
3244	conversationalist
3245	convert
3246	convey
3247	convict
3248	convince
3249	convinced
3250	convincing
3251	cook
3252	cook the supper
3253	cookbook
3254	cooked
3255	cooker
3256	cookery
3257	cookie
3258	cookie sale
3259	cookies
3260	cooking
3261	cooking dinner
3262	cooking pot
3263	cool
3264	cool down
3265	Cool!
3266	cooper
3267	cooperate
3268	co-operate
3269	cooperation
3270	co-operative
3271	cooperatively
3272	coordinate
3273	cop
3274	cope
3275	cope with
3276	copper
3277	copy
3278	copy down
3279	copyright
3280	coral
3281	Cordelia
3282	cordially
3283	cordless mouse
3284	core
3285	cormorant
3286	corn
3287	corner
3288	corner store
3289	cornerstone
3290	cornflakes
3291	corn-on-the-cob
3292	Cornwall
3293	corporate
3294	corporation
3295	correct
3296	correction
3297	correctional
3298	correctional facility
3299	correctly
3300	correspond
3301	correspond with
3302	correspond with ...
3303	correspondence
3304	correspondence course
3305	correspondent
3306	corridor
3307	corrupt
3308	corruption
3309	corset
3310	cosmetic surgery
3311	cosmetics
3312	cosmology
3313	cosmonaut
3314	cosmopolitan
3315	cost
3316	Costa Rica
3317	costly
3318	costume
3319	costume party
3320	cosy
3321	cottage
3322	cotton
3323	couch
3324	couch potato
3325	cough
3326	could
3327	couldn't
3328	council
3329	counsel
3330	counsellor
3331	count
3332	count down
3333	count on
3334	count to ten
3335	count up
3336	counter
3337	countless
3338	country
3339	Country Mouse
3340	country music
3341	Country Music Hall of Fame and Museum
3342	Country Music Hall of Fame Museum
3343	countryside
3344	county
3345	couple
3346	courage
3347	courageous
3348	courageously
3349	course
3350	court
3351	courteous
3352	courtesy
3353	courtroom
3354	courtyard
3355	cousin
3356	cover
3357	cover the cost of sth.
3358	cover with
3359	coverage
3360	covering
3361	covering letter
3362	covers
3363	cow
3364	coward
3365	cowardice
3366	cowboy
3367	cowboy hat
3368	coworker
3369	co-worker
3370	cowrie
3371	Cox
3372	cozy
3373	crab
3374	crack
3375	cracked
3376	cracker
3377	cradle
3378	craft
3379	craftsman
3380	craftsmanship
3381	crafty
3382	cram
3383	cranberry
3384	cranberry sauce
3385	crane
3386	crash
3387	crater
3388	crawl
3389	crawling
3390	crayon
3391	crayon holder
3392	crayons
3393	craze
3394	crazy
3395	cream
3396	crease
3397	create
3398	creation
3399	creative
3400	creatively
3401	creativity
3402	creator
3403	creature
3404	credible
3405	credit
3406	credit card
3407	credit rating
3408	creed
3409	creek
3410	crescent
3411	crested ibis
3412	Crete
3413	crew
3414	cricket
3415	crime
3416	criminal
3417	criminally
3418	crippled
3419	crisp
3420	crispy
3421	criteria
3422	criterion
3423	critic
3424	critical
3425	critically
3426	criticise
3427	criticism
3428	criticize
3429	croak
3430	crocodile
3431	crook
3432	crooked
3433	crop
3434	cross
3435	crossbow
3436	cross-country
3437	cross-dressing
3438	crossing
3439	crossroads
3440	crosstalk
3441	cross-talk
3442	crosswalk
3443	crossword
3444	crossword puzzle
3445	crowd
3446	crowd in
3447	crowded
3448	crown
3449	CRT monitor
3450	crucible
3451	crucify
3452	cruel
3453	cruelty
3454	cruise
3455	crunch
3456	crush
3457	crust
3458	cry
3459	cry at
3460	cry for
3461	cry out
3462	crystal
3463	cub
3464	Cuba
3465	cube
3466	cubic
3467	Cubism
3468	cucumber
3469	cue
3470	cuisine
3471	culminate
3472	cultivate
3473	cultivation
3474	cultural
3475	culturally
3476	culture
3477	culture shock
3478	culture-bound
3479	cunning
3480	cup
3481	cup of
3482	cupboard
3483	cure
3484	cure-all
3485	curiosity
3486	curious
3487	curiously
3488	curl
3489	curly
3490	currency
3491	current
3492	current events
3493	currently
3494	curriculum
3495	curriculum vitae
3496	curry
3497	curse
3498	cursor (application program)
3499	curtain
3500	curtsy
3501	curve
3502	cushion
3503	custom
3504	custom software
3505	customary
3506	customer
3507	customs
3508	cut
3509	cut ... down
3510	cut ... out
3511	cut ... short
3512	cut across
3513	cut back on
3514	cut down
3515	cut down on
3516	cut hair
3517	cut in (on sb/sth)
3518	cut off
3519	cut off from ...
3520	cut out
3521	cut sb. off from ...
3522	cut something out (of something)
3523	cut sth. off sth.
3524	cut the grass
3525	cut up
3526	cute
3527	cutlet
3528	cutting
3529	cut-up
3530	Cuzco
3531	CV
3532	cyber
3533	cyber cafe
3534	cybercrime
3535	cyberspace
3536	cycle
3537	cycle helmet
3538	cycling
3539	cyclist
3540	Cyclops
3541	cynical
3542	Czar
3543	Czech Republic
3544	dad
3545	daddy
3546	daffodil
3547	daily
3548	daily life
3549	dairy
3550	dairy product
3551	daisy
3552	Daisy
3553	daisy chain
3554	Dale
3555	dam
3556	damage
3557	damn
3558	damp
3559	Dan Dervish
3560	dance
3561	dance music
3562	dance to the music
3563	danced
3564	dancer
3565	dancing
3566	dandelion
3567	danger
3568	Danger!
3569	dangerous
3570	dangerously
3571	dangle
3572	Danielle
3573	Danish
3574	Danny
3575	dare
3576	dare to ...
3577	daring
3578	dark
3579	darkness
3580	Darlene Coulon
3581	darling
3582	dash
3583	data
3584	database
3585	database software
3586	date
3587	date back (to ... )
3588	date back (to)
3589	date back to
3590	date from
3591	daughter
3592	Dave
3593	David
3594	David Blaine
3595	dawn
3596	dawning
3597	day
3598	day after day
3599	day and night
3600	day by day
3601	day in and day out
3602	Day of the Dead
3603	daybreak
3604	daycare
3605	daydreaming
3606	daylight
3607	daytime
3608	dazzle
3609	dead
3610	dead ( right)
3611	dead to the world
3612	dead-end
3613	deadline
3614	deadly
3615	deaf
3616	deal
3617	deal with
3618	deal with sth.
3619	dealer
3620	Dean
3621	dear
3622	Dear
3623	death
3624	death penalty
3625	debate
3626	debater
3627	Debbie
3628	debit card
3629	debt
3630	Dec.
3631	decade
3632	decathlon
3633	decay
3634	deceitful
3635	deceive
3636	December
3637	decent
3638	deception
3639	deceptive
3640	decibel
3641	decide
3642	decide on
3643	decided
3644	decision
3645	decision-making
3646	decisively
3647	deck
3648	declaration
3649	Declaration of Independence
3650	declare
3651	declare war on
3652	decline
3653	decode
3654	decorate
3655	decoration
3656	decorations
3657	decrease
3658	dedicate
3659	dedicated
3660	dedication
3661	deduction
3662	deed
3663	deep
3664	deep in thought
3665	deep-breathing
3666	deepen
3667	deep-fried stuff
3668	deeply
3669	deep-rooted
3670	deep-sea
3671	deer
3672	defeat
3673	defence
3674	defend
3675	defend ... against
3676	defend ... from ...
3677	defense
3678	defensive
3679	defiance
3680	define
3681	define ... as ...
3682	definite
3683	definitely
3684	definition
3685	defragmenting
3686	defy
3687	degradation
3688	degrade
3689	degree
3690	deign
3691	delay
3692	delegate
3693	delete
3694	deliberately
3695	delicacy
3696	delicate
3697	delicately
3698	delicious
3699	delight
3700	delighted
3701	delightful
3702	deliver
3703	deliver a speech
3704	delivery
3705	delta
3706	demand
3707	demanding
3708	demo
3709	democratic
3710	demonstrate
3711	demonstration
3712	Dempsey
3713	den
3714	Dena Morin
3715	denim
3716	Denmark
3717	Dennis
3718	dental tools
3719	dentist
3720	deny
3721	depart
3722	department
3723	department store
3724	departure
3725	depend
3726	depend on
3727	depend on ...
3728	depend on sb./sth.
3729	depend on/upon
3730	depend upon
3731	dependent
3732	depletion
3733	deposit
3734	Depp
3735	deprecation
3736	depress
3737	depressed
3738	depressing
3739	depression
3740	deprive
3741	depth
3742	deputy
3743	deregulate
3744	derive
3745	derive from
3746	descend
3747	descendant
3748	descent
3749	describe
3750	describe ... as
3751	description
3752	desert
3753	deserted
3754	desertification
3755	deserve
3756	design
3757	designer
3758	desirable
3759	desire
3760	desk
3761	desk-cycle
3762	desktop
3763	despair
3764	desperate
3765	desperately
3766	desperation
3767	despite
3768	dessert
3769	destination
3770	destined
3771	destiny
3772	destroy
3773	destroyed
3774	destroyer
3775	destruction
3776	detached
3777	detail
3778	detailed
3779	detect
3780	detective
3781	detective story
3782	deteriorate
3783	deterioration
3784	determination
3785	determine
3786	determined
3787	detour
3788	detract
3789	detract from
3790	develop
3791	develop out of ...
3792	developer
3793	development
3794	device
3795	device driver
3796	devil
3797	devise
3798	devote
3799	devote ... to
3800	devote oneself to
3801	devoted
3802	devotion
3803	diabetes
3804	diagnose
3805	diagnostic utility
3806	diagram
3807	dial
3808	dialect
3809	dialog
3810	dialog box
3811	dialogue
3812	dial-up access
3813	diameter
3814	diamond
3815	diary
3816	dice
3817	dictation
3818	diction
3819	dictionary
3820	did
3821	did+base verb
3822	didn't
3823	didn't+base verb
3824	die
3825	die away
3826	die down
3827	die for
3828	die from
3829	die of
3830	die off
3831	die out
3832	died out
3833	diehard
3834	diet
3835	differ
3836	differ from
3837	differ from ...
3838	difference
3839	different
3840	different from
3841	different kinds of
3842	different to ...
3843	different varieties of
3844	differentiate
3845	differently
3846	difficult
3847	difficulty
3848	dig
3849	dig in
3850	dig out
3851	digest
3852	digestion
3853	digital
3854	digital camera
3855	digital divide
3856	digital subscriber line
3857	digital versatile disc-ROM
3858	digital video camera
3859	digital video disc-ROM
3860	dignity
3861	dilemma
3862	diligence
3863	diligent
3864	dim
3865	dimension
3866	diminish
3867	dimly
3868	dimsum
3869	d'Incarville
3870	dine
3871	dining
3872	dining hall
3873	dining room
3874	dinner
3875	dinner jacket
3876	dinner on a plate
3877	dinosaur
3878	dioxide
3879	dip
3880	diploma
3881	diplomacy
3882	diplomat
3883	direct
3884	direct mail
3885	direction
3886	directions
3887	directly
3888	director
3889	directory
3890	dirt
3891	dirty
3892	disability
3893	disable
3894	disabled
3895	disadvantage
3896	disadvantageous
3897	disagree
3898	disagree with
3899	disagree with sb.
3900	disagreeable
3901	disagreement
3902	disallow
3903	disappear
3904	disappearance
3905	disappoint
3906	disappointed
3907	disappointing
3908	disappointment
3909	disapproval
3910	disapprove
3911	disarmament
3912	disaster
3913	disastrous
3914	disbelief
3915	disc
3916	discipline
3917	disclose
3918	disco
3919	discomfort
3920	disconnect
3921	discontent
3922	discount
3923	discourage
3924	discouraged
3925	discouragement
3926	discourse
3927	discover
3928	discovery
3929	discretion
3930	discriminate
3931	discrimination
3932	discus
3933	discuss
3934	discussion
3935	disease
3936	disgraced
3937	disguise
3938	disgust
3939	disgusting
3940	dish
3941	dishes
3942	dishonest
3943	dishwasher
3944	disillusioned
3945	disk
3946	disk defragmenter
3947	Disk Operating System
3948	disk scanner
3949	dislike
3950	dislocation
3951	dismay
3952	dismiss
3953	Disney Cruise
3954	Disney World
3955	Disneyland
3956	disobey
3957	disorder
3958	disorganised
3959	dispatch
3960	dispenser
3961	disperse
3962	displace
3963	displacement
3964	display
3965	display device
3966	displayed
3967	disposable income
3968	disposal
3969	dispose
3970	disposition
3971	dispute
3972	disrespectful
3973	disrespectfully
3974	dissatisfied
3975	dissolve
3976	distance
3977	distance learning
3978	distant
3979	distill
3980	distinct
3981	distinction
3982	distinctive
3983	distinctly
3984	distinguish
3985	distinguish ... from ...
3986	distinguishing
3987	distort
3988	distract
3989	distract one's mind
3990	distraction
3991	distribute
3992	distribution
3993	district
3994	disturb
3995	disturbance
3996	disturbing
3997	disuse
3998	dive
3999	dive (right) in
4000	dive into
4001	dive into ...
4002	diver
4003	diverge
4004	diverse
4005	diversity
4006	divert
4007	divide
4008	divide ... into
4009	divide ... into ...
4010	divide into
4011	divide into ...
4012	divide up
4013	divided
4014	dividend
4015	dividing line
4016	diving
4017	division
4018	divorce
4019	DIY
4020	dizziness
4021	dizzy
4022	DJ
4023	DNA
4024	do
4025	do (my) homework
4026	do (one's) homework
4027	do ... homework
4028	do a good job
4029	do a great job in sth.
4030	do a survey
4031	do damage to
4032	do everything in one's power to ...
4033	do exercise
4034	do experiments
4035	do good (to) ...
4036	do great harm to
4037	do harm to
4038	do homework
4039	do kung fu
4040	do morning exercises
4041	do one's best
4042	do one's homework
4043	do one's part
4044	do one's part to do sth.
4045	do one's share
4046	do research
4047	do shopping
4048	do some cleaning
4049	do some reading
4050	do some research
4051	do some shopping
4052	do some training
4053	do tai chi
4054	do the dishes
4055	do the housework
4056	do well in
4057	do well in ...
4058	do with
4059	Do you want to come with me?
4060	do/try one's best
4061	dock
4062	docket
4063	doctor
4064	doctorate
4065	document
4066	documentary
4067	dodo
4068	does
4069	doesn't
4070	dog
4071	dog sled
4072	dog sledding
4073	doggie
4074	doggy
4075	doing
4076	doing jigsaw puzzles
4077	doing morning exercises
4078	doll
4079	dollar
4080	Dollywood
4081	dolphin
4082	domain name
4083	dome
4084	domestic
4085	domestic market
4086	dominant
4087	dominate
4088	domination
4089	domineering
4090	Donald Duck
4091	donate
4092	donation
4093	done
4094	donkey
4095	donor
4096	don't
4097	don't mention it
4098	Don't worry.
4099	donut
4100	doom
4101	doomed
4102	door
4103	doorbell
4104	doorman
4105	doormat
4106	doorstep
4107	doorway
4108	doping
4109	Dora
4110	dormitory
4111	DOS
4112	dose
4113	dot
4114	double
4115	Double Ninth Festival
4116	double-check
4117	double-decker
4118	doubt
4119	doubtful
4120	dough
4121	doughnut
4122	douse
4123	dove
4124	down
4125	down through the years
4126	downer
4127	downhill
4128	download
4129	downloading
4130	downpour
4131	downsize
4132	downstairs
4133	downstream
4134	downtown
4135	downward
4136	downwards
4137	doze
4138	dozen
4139	dozens of
4140	Dr
4141	Dr.
4142	Dr.Watson
4143	draft
4144	drag
4145	drag out ...
4146	dragon
4147	dragon boat
4148	Dragon Boat Festival
4149	dragon boat race
4150	dragon dance
4151	drain
4152	drama
4153	drama series
4154	dramatic
4155	dramatic play
4156	dramatically
4157	drank
4158	drank cold drinks
4159	draught
4160	draught beer
4161	draw
4162	draw ... out of ...
4163	draw a conclusion
4164	draw a conclusion from
4165	draw a useful lesson from
4166	draw attention to sth.
4167	draw back
4168	draw cartoons
4169	draw near
4170	draw on
4171	draw one's attention
4172	draw pictures
4173	draw sb. away from ...
4174	draw sb's attention to
4175	draw someone's attention to
4176	draw up
4177	draw upon
4178	draw water
4179	drawback
4180	drawer
4181	drawing
4182	dread
4183	dreadful
4184	dream
4185	dream of
4186	dream of being ...
4187	dream of/about
4188	dream team
4189	dreamed
4190	dreamlike
4191	dreamy
4192	dress
4193	dress ... in
4194	dress up
4195	dress up as
4196	dresser
4197	dressing
4198	dressmaker
4199	drew
4200	dried food
4201	drift
4202	driftnet
4203	drill
4204	drink
4205	drink tea
4206	drink to sb./sth.
4207	drink water
4208	drinking
4209	drinks
4210	drip
4211	drip with
4212	drive
4213	drive ... away
4214	drive a (car)
4215	drive away
4216	drive out
4217	drive sb mad
4218	drive sb. crazy
4219	drive sb. mad
4220	drive-in
4221	driver
4222	driver's hat
4223	driveway
4224	drizzle
4225	droop
4226	drop
4227	drop a hint
4228	drop by
4229	drop in
4230	drop into
4231	drop off
4232	drop out
4233	drop out of school
4234	drop to
4235	drop to ...
4236	drop-out
4237	dropped
4238	drought
4239	drove
4240	drown
4241	drown out
4242	drug
4243	drugstore
4244	drum
4245	drum set
4246	drummer
4247	drums
4248	drunk
4249	drunken
4250	dry
4251	dry out
4252	dry up
4253	DSL
4254	dual
4255	duchess
4256	duck
4257	duckling
4258	due
4259	due to
4260	duke
4261	dull
4262	dumb
4263	dumbness
4264	dump
4265	dumpling
4266	dumplings
4267	dune
4268	Dunvegan Castle
4269	durable
4270	duration
4271	durian
4272	during
4273	dusk
4274	dust
4275	dust storm
4276	dustbin
4277	dusty
4278	Dutch
4279	duty
4280	DVD
4281	DVD-ROM
4282	DVD-ROM drive
4283	DVD-video format
4284	DVI
4285	DVI port
4286	dwarf
4287	dwell
4288	dye
4289	dying
4290	dynamic
4291	dynamite
4292	dynasty
4293	each
4294	each other
4295	eager
4296	eager to do sth
4297	eagerly
4298	eagle
4299	ear
4300	ear lobe
4301	earache
4302	early
4303	earmuff
4304	earn
4305	earn one's living
4306	earnest
4307	earphone
4308	earring
4309	ears
4310	earth
4311	Earth
4312	earthquake
4313	ease
4314	easily
4315	easiness
4316	east
4317	East Asian countries
4318	Easter
4319	Easter Bunny
4320	eastern
4321	eastern Asia
4322	eastward
4323	easy
4324	easy chair
4325	easy-going
4326	easy-to-use
4327	eat
4328	eat (breakfast)
4329	eat breakfast
4330	eat dinner
4331	eat lunch
4332	eat one's heart out
4333	eat out
4334	eat seafood
4335	eat up
4336	eaten
4337	eating
4338	eating lunch
4339	e-book
4340	e-card
4341	eccentric
4342	echo
4343	eclipse
4344	eco-friendly
4345	ecological
4346	ecology
4347	e-commerce
4348	economic
4349	economical
4350	economics
4351	economy
4352	ecosystem
4353	ecotourism
4354	edelweiss
4355	edge
4356	edible
4357	Edinburgh
4358	Edison
4359	edit
4360	edition
4361	editor
4362	editors
4363	Edmonton
4364	Edmund Hillary
4365	e-dog
4366	educate
4367	educated
4368	education
4369	educational
4370	educational software
4371	educator
4372	Edward Lear
4373	eel
4374	effect
4375	effective
4376	effectively
4377	effectiveness
4378	efficiency
4379	efficient
4380	efficiently
4381	effort
4382	effortless
4383	effortlessly
4384	e-friend
4385	EFTPOS
4386	egg
4387	eggplant
4388	eggs
4389	eggshell
4390	egret
4391	Egypt
4392	Egyptian
4393	eh
4394	Eiffel Tower
4395	eight
4396	eighteen
4397	eighteenth
4398	eighth
4399	eighty
4400	either
4401	either ... or
4402	either ... or ...
4403	either way
4404	elaborate
4405	elapse
4406	elastic
4407	elbow
4408	elder
4409	elderly
4410	e-learning
4411	elect
4412	electric
4413	electric lights
4414	electric shock
4415	electrical
4416	electrician
4417	electricity
4418	electrochemical
4419	electronic
4420	electronic commerce
4421	electronic media
4422	electronics
4423	elegant
4424	elegantly
4425	element
4426	elementary
4427	elephant
4428	elevate
4429	elevated
4430	elevated railway
4431	elevated road
4432	elevator
4433	eleven
4434	eleventh
4435	elf
4436	Elias
4437	eliminate
4438	Eliza
4439	Elizabeth Fry
4440	else
4441	elsewhere
4442	elusive
4443	email
4444	e-mail
4445	embarrass
4446	embarrassed
4447	embarrassing
4448	embarrassingly
4449	embarrassment
4450	embassy
4451	embedded operating system
4452	emblem
4453	embody
4454	embrace
4455	embryo
4456	emerge
4457	emergence
4458	emergency
4459	emergency exit
4460	emergency services
4461	emergency-room
4462	emigrate
4463	emigration
4464	Emily
4465	emission
4466	emotion
4467	emotional
4468	empathize
4469	emperor
4470	emphasis
4471	emphasise
4472	emphasize
4473	emphatic
4474	empire
4475	employ
4476	employee
4477	employer
4478	employment
4479	employment contract
4480	emptiness
4481	empty
4482	empty-handed
4483	enable
4484	enable sb. to do sth.
4485	enact
4486	encapsulate
4487	encircle
4488	enclose
4489	enclosed
4490	enclosure
4491	encounter
4492	encourage
4493	encourage ... to do ...
4494	encouragement
4495	encyclopaedia
4496	encyclopaedic
4497	encyclopedia
4498	end
4499	end up
4500	end up with
4501	end up with sth.
4502	endanger
4503	endangered
4504	endeavour
4505	ending
4506	endless
4507	end-of-term
4508	endow
4509	endurable
4510	endurance
4511	endure
4512	enduring
4513	enemy
4514	energetic
4515	energy
4516	enforce
4517	engage
4518	engage in
4519	engage in sth.
4520	engagement
4521	engine
4522	engineer
4523	engineering
4524	England
4525	English
4526	English book
4527	English class
4528	English-Chinese dictionary
4529	English-speaking
4530	English-speaking countries
4531	engrave
4532	enhance
4533	enjoy
4534	enjoy doing ...
4535	enjoy oneself
4536	enjoy reading
4537	enjoy themselves
4538	enjoyable
4539	enjoyably
4540	enjoyment
4541	enlarge
4542	enlighten
4543	enlightened
4544	enlightenment
4545	enormity
4546	enormous
4547	enough
4548	enquire
4549	enquiry
4550	enrich
4551	enrol
4552	enslave
4553	enslavement
4554	ensure
4555	enter
4556	enter a race
4557	enter upon
4558	entered
4559	enterprise
4560	enterprise agreement
4561	enterprising
4562	entertain
4563	entertainer
4564	entertaining
4565	entertainment
4566	entertainment software
4567	enthusiasm
4568	enthusiast
4569	enthusiastic
4570	enthusiastically
4571	entice
4572	entire
4573	entirely
4574	entitle
4575	entrance
4576	entrance examinations (for)
4577	entry
4578	envelop
4579	envelope
4580	envious
4581	environment
4582	environmental
4583	environmentalist
4584	envy
4585	enzyme
4586	e-pal
4587	epic
4588	epidemic
4589	episode
4590	equal
4591	equal to
4592	equality
4593	equally
4594	equator
4595	equip
4596	equipment
4597	equity
4598	equivalent
4599	er
4600	era
4601	erasable CD
4602	erase
4603	eraser
4604	erect
4605	Eric
4606	erosion
4607	errand
4608	error
4609	erupt
4610	eruption
4611	escape
4612	escape from ...
4613	especially
4614	essay
4615	essential
4616	establish
4617	established
4618	estimate
4619	estuary
4620	etc
4621	etc.
4622	eternally
4623	ethical
4624	ethical decision
4625	ethics
4626	Ethiopia
4627	ethnic
4628	ethnic groups
4629	ethos
4630	e-ticket
4631	eucalyptus
4632	eureka
4633	Europe
4634	European
4635	evacuation
4636	evaluate
4637	evaluation
4638	eve
4639	even
4640	even if
4641	even though
4642	even worse
4643	evening
4644	evenly
4645	event
4646	eventual
4647	eventually
4648	ever
4649	ever since
4650	ever since ...
4651	every
4652	Every coin has two sides.
4653	every day
4654	every four years
4655	every now and then
4656	every other week
4657	every penny
4658	every so often
4659	every year
4660	everybody
4661	everyday
4662	everyone
4663	everything
4664	everywhere
4665	evidence
4666	evident
4667	evidently
4668	evil
4669	evil spirits
4670	evolution
4671	evolve
4672	Ewell
4673	exact
4674	exactly
4675	exaggerate
4676	exaggeration
4677	exalt
4678	exam
4679	examination
4680	examine
4681	example
4682	excavate
4683	excavation
4684	exceed
4685	excellence
4686	excellent
4687	excellently
4688	except
4689	except for
4690	exception
4691	exceptional
4692	excerpt
4693	excess
4694	excessive
4695	exchange
4696	exchange ( ... ) for
4697	exchange ... for ...
4698	exchange student
4699	excite
4700	excited
4701	excitement
4702	exciting
4703	exclaim
4704	exclamation
4705	exclude
4706	exclusion
4707	excursion
4708	excuse
4709	excuse me
4710	Excuse me!
4711	Excuse me.
4712	Excuse me. May I have ...?
4713	execute
4714	execution
4715	executive
4716	exemplify
4717	exercise
4718	exercise book
4719	exert
4720	exhaust
4721	exhausted
4722	exhaustion
4723	exhibit
4724	exhibition
4725	exhibitor
4726	ex-husband
4727	exile
4728	exist
4729	existence
4730	existent
4731	exit
4732	exotic
4733	expand
4734	expand one's horizons
4735	expanse
4736	expansion
4737	expansion card
4738	expansion slot
4739	expansive
4740	expect
4741	expectancy
4742	expectantly
4743	expectation
4744	expected
4745	expectedly
4746	expedition
4747	expel
4748	expenditure
4749	expense
4750	expenses
4751	expensive
4752	experience
4753	experienced
4754	experiment
4755	experimental
4756	expert
4757	expertise
4758	explain
4759	explaining
4760	explanation
4761	explicit
4762	explode
4763	exploit
4764	exploration
4765	explore
4766	explorer
4767	explosion
4768	explosive
4769	expo
4770	export
4771	expose
4772	expose ... to
4773	exposition
4774	exposure
4775	express
4776	expression
4777	expressive
4778	extend
4779	Extended Binary Coded Decimal Interchange Code
4780	extension
4781	extensive
4782	extensively
4783	extent
4784	external
4785	extinct
4786	extinction
4787	extra
4788	extract
4789	extraordinary
4790	extraterrestrial
4791	extravagant
4792	extreme
4793	extremely
4794	extrovert
4795	eye
4796	eye contact
4797	eyebrow
4798	eye-catching
4799	eyeglasses
4800	eyes
4801	eyesight
4802	eyewitness
4803	fable
4804	fabric
4805	fabulous
4806	face
4807	face cream
4808	face to face
4809	facelift
4810	face-to-face
4811	facial
4812	facility
4813	fact
4814	factor
4815	factory
4816	factory worker
4817	factual
4818	faculty
4819	fade
4820	fade away
4821	fade in
4822	fade out
4823	Fahrenheit
4824	fail
4825	fail in doing sth.
4826	failure
4827	faint
4828	fair
4829	fairest
4830	fairly
4831	fairness
4832	fairy
4833	fairy story
4834	fairy tale
4835	fairytale
4836	faith
4837	faithful
4838	faithfully
4839	fake
4840	fall
4841	fall apart
4842	fall asleep
4843	fall away
4844	fall behind
4845	fall down
4846	fall for
4847	fall from ...
4848	fall ill
4849	fall in love
4850	fall in love with
4851	fall in love with ...
4852	fall in love with sb
4853	fall into
4854	fall into ...
4855	fall into ruin
4856	fall off
4857	fall off ...
4858	fall on
4859	fall on deaf ears
4860	fall on one's back
4861	fall out
4862	fall over
4863	fall short of
4864	fallen
4865	false
4866	faltering
4867	fame
4868	familiar
4869	familiarity
4870	family
4871	family name
4872	family picture
4873	family reunion
4874	family tree
4875	famine
4876	famous
4877	fan
4878	fan club
4879	fan dance
4880	fancy
4881	fantastic
4882	fantasy
4883	FAQ
4884	FAQs
4885	far
4886	far and wide
4887	far away
4888	far away from
4889	far away from ...
4890	far from
4891	far too
4892	far too much
4893	faraway
4894	fare
4895	farewell
4896	farm
4897	farmer
4898	farmhouse
4899	farming
4900	farmland
4901	farmyard
4902	farther
4903	farthest
4904	fascinate
4905	fascinated
4906	fascinating
4907	fascination
4908	fascist
4909	fashion
4910	fashion designer
4911	fashion show
4912	fashionable
4913	fast
4914	fast asleep
4915	fast food
4916	fasten
4917	faster
4918	fastest
4919	fast-food restaurant
4920	fat
4921	fatal
4922	fate
4923	fateful
4924	father
4925	Father Christmas
4926	Father Farges
4927	Father of Hybrid Rice
4928	Father's Day
4929	fathom
4930	fatigue
4931	fault
4932	fault-tolerant computer
4933	favorite
4934	favour
4935	favourite
4936	fax
4937	fear
4938	Fear makes the wolf bigger than he is.
4939	fearless
4940	feasible
4941	feast
4942	feat
4943	feather
4944	feature
4945	Feb.
4946	February
4947	fed up
4948	fed up with
4949	federal
4950	fee
4951	feed
4952	feed chickens
4953	feed on
4954	feed the bird
4955	feed the dog
4956	feedback
4957	feeder
4958	feeding
4959	feeding the fish
4960	feel
4961	feel ashamed for
4962	feel ashamed of
4963	feel at ease
4964	feel awful
4965	feel blue
4966	feel close to somebody
4967	feel extremely dizzy
4968	feel free
4969	feel guilty for sth.
4970	feel like
4971	feel like (doing)
4972	feel like (doing) sth.
4973	feel like doing something
4974	feel like doing sth.
4975	feel lucky to do ...
4976	feel obligated to
4977	feel pleased with sb./sth.
4978	feel proud
4979	feel relieved
4980	feel sorry about
4981	feel sorry for sth.
4982	feel thrilled about sth
4983	feel unsure about ...
4984	feel well
4985	feel well prepared for sth.
4986	feel/be amazed at
4987	feel/be content with
4988	feeling
4989	feet
4990	fell
4991	fellow
4992	fellow student
4993	fellow students
4994	felt
4995	felt happy
4996	female
4997	female connectors
4998	fence
4999	fern
5000	ferry
5001	fertile
5002	fertilizer
5003	festival
5004	festive
5005	fetch
5006	fete
5007	feudal
5008	fever
5009	few
5010	fewest
5011	fiancé
5012	fiancée
5013	fibre
5014	fiction
5015	fictitious
5016	fiddle
5017	fiddle with sth.
5018	field
5019	field event
5020	fierce
5021	fiercely
5022	fiery
5023	fifteen
5024	fifteenth
5025	fifth
5026	fifty
5027	fifty-four
5028	fight
5029	fight fires
5030	fight over ...
5031	fighter
5032	figurative
5033	figuratively
5034	figure
5035	figure out
5036	figure skater
5037	file
5038	file cabinet
5039	file compression utility
5040	file manager
5041	file name
5042	File Transfer Protocol
5043	fill
5044	fill ... with
5045	fill ... with ...
5046	fill in
5047	fill out
5048	fill with sth.
5049	filling
5050	film
5051	film maker
5052	film-maker
5053	filter
5054	filthy
5055	fin
5056	final
5057	final exam
5058	finally
5059	finance
5060	finances
5061	financial
5062	financial commitment
5063	financial distress
5064	financial year
5065	financially
5066	find
5067	find bones in an egg
5068	find fault with (somebody/something)
5069	find one's way out
5070	find one's way to
5071	find out
5072	find out about
5073	find the right way to do sth.
5074	find ways to
5075	finder
5076	finding
5077	fine
5078	fine arts
5079	finely
5080	finger
5081	fingernail
5082	fingerprint
5083	finish
5084	finish off
5085	finished
5086	finishing touch
5087	Finland
5088	fiord
5089	fire
5090	fire chief
5091	fire engine
5092	fire hat
5093	fire off
5094	fire station
5095	fire truck
5096	firearm
5097	firecracker
5098	firecrackers
5099	firefighter
5100	firefighter's hat
5101	firefighting
5102	fireman
5103	fireplace
5104	FireWire port
5105	firewood
5106	firework
5107	fireworks
5108	firm
5109	firmly
5110	firmness
5111	firmware
5112	first
5113	first aid
5114	first floor
5115	first name
5116	First Nations
5117	first of all
5118	first place
5119	first prize
5120	first-ever
5121	firstly
5122	fish
5123	fish and chips
5124	fish in a fishbowl
5125	fish sth. out (of sth.)
5126	fisherman
5127	fishing
5128	fishing pole
5129	fist
5130	fit
5131	fit for
5132	fit in
5133	fit into
5134	fitness
5135	fitting
5136	five
5137	five-stones
5138	fix
5139	fix ... on
5140	fix on
5141	fix one's attention on
5142	fix one's eyes on
5143	fix teeth
5144	fix up
5145	fixed
5146	fixed disk
5147	fixed expenditure
5148	flag
5149	Flag Day
5150	flame
5151	flannel
5152	flap
5153	flash
5154	flash card
5155	flashback
5156	flashlight
5157	flashy
5158	flat
5159	flat panel monitor
5160	flat tire
5161	flatmate
5162	flat-panel display
5163	flatten
5164	flatter
5165	flattered
5166	flattery
5167	flavor
5168	flavour
5169	flavourful
5170	flaw
5171	flaxen
5172	flea
5173	flea market
5174	flee
5175	fleece
5176	fleet
5177	flesh
5178	flew
5179	flexibility
5180	flexible
5181	flick
5182	flies
5183	flight
5184	flight attendant
5185	flipper
5186	float
5187	float away into
5188	float off
5189	floated
5190	flock
5191	flood
5192	flooding
5193	floodlight
5194	floor
5195	floor plan
5196	floppy disk
5197	floppy disk drive
5198	Florida
5199	florist
5200	flour
5201	flourish
5202	flow
5203	flow into
5204	flow out of ...
5205	flow over
5206	flower
5207	flower shop
5208	flower show
5209	flower-drum dance
5210	flowered
5211	flowers
5212	flowery
5213	flu
5214	fluency
5215	fluent
5216	fluently
5217	fluid
5218	flush
5219	flute
5220	flutter
5221	fly
5222	fly a kite
5223	fly away
5224	fly kites
5225	fly off the handle
5226	fly planes
5227	flying
5228	flying a kite
5229	flyover
5230	foam
5231	focus
5232	focus on
5233	focus on sb./sth.
5234	fog
5235	foggy
5236	fold
5237	Fold the (shirt).
5238	fold up
5239	folk
5240	folk song
5241	follow
5242	follow a rule
5243	follow in one's footsteps
5244	follow one's example
5245	follow something up
5246	follow the rules
5247	follower
5248	following
5249	follw
5250	fond
5251	font
5252	font size
5253	font style
5254	food
5255	food chain
5256	food for thought
5257	food supply
5258	food tray
5259	fool
5260	fool around
5261	foolish
5262	foolishness
5263	foot
5264	football
5265	football field
5266	football player
5267	footballer
5268	footprint
5269	footstep
5270	footwear
5271	for
5272	for a minute
5273	for a moment
5274	for a start
5275	for a time
5276	for a while
5277	for ages
5278	for an instant
5279	for certain
5280	for example
5281	for fear that
5282	for free
5283	for good
5284	for good measure
5285	for instance
5286	for now
5287	for one's own sake
5288	for rent
5289	for sale
5290	for sb.
5291	for sb.'s sake
5292	for somebody's sake
5293	for sure
5294	for the first time
5295	for the moment
5296	for the most part
5297	for the purpose of
5298	for the sake of
5299	for the taking
5300	for various reasons
5301	for you
5302	forbid
5303	forbidding
5304	force
5305	force-feed
5306	forcibly
5307	ford
5308	forearm
5309	forecast
5310	forefinger
5311	foreground
5312	forehead
5313	foreign
5314	foreign market
5315	foreigner
5316	forensic
5317	foresee
5318	forest
5319	forestry
5320	forever
5321	forge
5322	forgery
5323	forget
5324	forgetful
5325	forgettable
5326	forgive
5327	forgiveness
5328	forgot
5329	forgotten
5330	fork
5331	form
5332	form sth. in one's mind
5333	formal
5334	formalize
5335	formally
5336	format
5337	formation
5338	formatting
5339	former
5340	formerly
5341	formula
5342	fortify
5343	fortify oneself against sth./sb.
5344	fortnight
5345	fortnightly
5346	fortunate
5347	fortunately
5348	fortune
5349	fortune-telling
5350	forty
5351	forty-five
5352	forty-six
5353	forward
5354	forward-looking
5355	forwards
5356	fossil
5357	foster
5358	Foster
5359	foul
5360	found
5361	foundation
5362	founder
5363	fountain
5364	fountainhead
5365	four
5366	fourteen
5367	fourteenth
5368	fourth
5369	fourthly
5370	fox
5371	fragile
5372	fragmented
5373	fragrance
5374	fragrant
5375	Fragrant Hills Park
5376	frail
5377	frame
5378	framework
5379	franc
5380	France
5381	frank
5382	Frank
5383	Frank Worsley
5384	frankly
5385	frankly speaking
5386	frankness
5387	fraternity
5388	freckle
5389	Fred
5390	Freddy
5391	Frederick WilliamⅠ
5392	free
5393	free (to do something)
5394	free from
5395	free of charge
5396	free time
5397	freedom
5398	freelancer
5399	freely
5400	freestyle
5401	freeware
5402	freeway
5403	freeze
5404	freezer
5405	freezing
5406	French
5407	French fries
5408	frequency
5409	frequent
5410	frequently
5411	fresh
5412	freshening
5413	freshly
5414	freshman
5415	freshwater
5416	fretfully
5417	friction
5418	frictionless
5419	Friday
5420	fridge
5421	fried
5422	fried food
5423	fried rice
5424	friend
5425	friendliness
5426	friendly
5427	friendship
5428	fries
5429	fright
5430	frighten
5431	frightened
5432	frightening
5433	Frisbee
5434	frog
5435	from
5436	from ... on
5437	from ... to ...
5438	from different aspects
5439	from door to door
5440	from here on
5441	from now on
5442	from that day on
5443	from that moment on
5444	from the bottom of one's heart
5445	from then on
5446	from time to time
5447	front
5448	front page
5449	frontier
5450	frost
5451	frown
5452	frozen
5453	fruit
5454	fruitful
5455	fruits
5456	fruity
5457	frustrated
5458	frustration
5459	fry
5460	Fryderyk Chopin
5461	FTP
5462	fuel
5463	fulfil
5464	fulfill
5465	fulfilling
5466	fulfillment
5467	fulfilment
5468	full
5469	full of
5470	full of sth.
5471	full-length
5472	full-scale
5473	full-time
5474	full-time teaching post
5475	full-time work
5476	fully
5477	fun
5478	function
5479	function keys
5480	fund
5481	fundamental
5482	fundamentally
5483	funeral
5484	funfair
5485	funnel
5486	funnelweb spider
5487	funny
5488	fur
5489	furious
5490	furnish
5491	furnished
5492	furniture
5493	furry
5494	further
5495	furthermore
5496	furthest
5497	fusion
5498	future
5499	futurologist
5500	futurology
5501	Futuroscope
5502	gable
5503	gadget
5504	gaiety
5505	gaily
5506	gain
5507	gain a place at/in
5508	gain entry to
5509	gain self-confidence
5510	gain weight
5511	galaxy
5512	gale
5513	gall-bladder
5514	gallery
5515	gallon
5516	gallop
5517	gamble
5518	game
5519	game board
5520	game show
5521	game-maker
5522	gang
5523	gap
5524	gap year
5525	garage
5526	garbage
5527	garbage can
5528	garbage in
5529	garbage out*
5530	Garcia
5531	garden
5532	gardener
5533	gardening
5534	garlic
5535	garment
5536	Garth Brooks
5537	gas
5538	gas stove
5539	gas tank
5540	gasoline
5541	gasoline-powered
5542	gasp
5543	gasp with surprise
5544	gate
5545	gatekeeper
5546	gateway
5547	gather
5548	gather at ...
5549	gather round
5550	gatherer
5551	gathering
5552	gaudy
5553	gaunt
5554	gave
5555	gay
5556	gaze
5557	gaze at
5558	gaze at sb. with tears
5559	G'day mates!
5560	gear
5561	geek
5562	gem
5563	gender
5564	gene
5565	general
5566	generally
5567	generally speaking
5568	generate
5569	generation
5570	generation gap
5571	generator
5572	generous
5573	gene-therapy
5574	genetic
5575	genetically
5576	genetically modified
5577	genetics
5578	genial
5579	genius
5580	genocide
5581	genre
5582	genre fiction
5583	Gentile
5584	gentle
5585	gentleman
5586	gentlemanly
5587	gently
5588	genuine
5589	genuinely
5590	genuineness
5591	geographical
5592	geography
5593	Geography
5594	geological
5595	geologist
5596	geology
5597	geometry
5598	George Bernard Shaw
5599	George Crum
5600	George Eliot
5601	George Hambley
5602	George Stephenson
5603	Georgetown
5604	Georgia
5605	germ
5606	German
5607	Germanic
5608	Germany
5609	gesture
5610	get
5611	get (somebody) nowhere
5612	get ... back
5613	get ... for free
5614	get ... from ...
5615	get ... in
5616	get ... together
5617	get a grip on
5618	get a haircut
5619	get a kick out of
5620	get a surprise
5621	get a telephone call
5622	get a timely treatment
5623	get accustomed to sth.
5624	get across
5625	get along
5626	get along with
5627	get along with ...
5628	get along/on with
5629	get around
5630	get at
5631	get away
5632	get away from
5633	get away with
5634	get back
5635	get better at sth.
5636	get by
5637	get caught
5638	get chilled to the bone
5639	get close to
5640	get down
5641	get down ...
5642	get down to sth.
5643	get dressed
5644	get enough rest
5645	get fat
5646	get hold of
5647	get home
5648	get hooked on
5649	get hurt
5650	get in the way
5651	get in the way of
5652	get in touch
5653	get in touch with
5654	get in trouble
5655	get interested in
5656	get into
5657	get into shape
5658	get into the habit of ...
5659	get into trouble
5660	get involved with
5661	get lost
5662	get mad
5663	get married
5664	get off
5665	get on
5666	get on well with sb.
5667	get on with
5668	get on with sth.
5669	get one's mind off
5670	get one's point
5671	get one's way
5672	get online
5673	get out
5674	get out of
5675	get out of control
5676	get over
5677	get popular
5678	get ready
5679	get ready for
5680	get ready for sth
5681	get ready to
5682	get rid of
5683	get round
5684	get sb. to do sth.
5685	get some exercise
5686	get some sense of
5687	get something across
5688	get started
5689	get straight A's
5690	Get the book.
5691	get the hang of
5692	get the most out of
5693	get through
5694	get tired of doing sth.
5695	get to
5696	get to know
5697	get to one's feet
5698	get to school
5699	get to work
5700	get to work straight away
5701	get together
5702	get up
5703	get used to
5704	get used to sth.
5705	get well
5706	get wind of ...
5707	get/be involved in
5708	get/be tired of
5709	get/have a (high) fever
5710	geyser
5711	Ghana
5712	ghastly
5713	ghost
5714	giant
5715	giant panda
5716	GIF
5717	gift
5718	gifted
5719	gigabyte
5720	gigahertz
5721	gigantic
5722	giggle
5723	Gina
5724	ginger
5725	gingko tree
5726	Giotto di Bondone
5727	giraffe
5728	gird
5729	girl
5730	girlfriend
5731	give
5732	give ... a big hug
5733	give ... a lift
5734	give ... a push
5735	give a helping hand
5736	give a talk
5737	give an account of
5738	give and take
5739	give away
5740	give birth to
5741	give concerts
5742	give credit for
5743	give in
5744	give in to
5745	give it a try
5746	give life to
5747	give off
5748	give one's life for
5749	give oneself up (to ... )
5750	give out
5751	give priority to ...
5752	give relief
5753	give sb. a hand
5754	give sb. a hug
5755	give sb. a lesson
5756	give sb. a ride
5757	give somebody the edge
5758	give speeches
5759	give thanks to sb. for sth.
5760	give thought to
5761	give up
5762	give way
5763	give way to
5764	give way to ...
5765	given
5766	glacier
5767	glad
5768	Gladys Claffern
5769	glamorous
5770	glance
5771	glance at
5772	glance at sth.
5773	glance through
5774	glare
5775	glare at
5776	Glasgow
5777	glass
5778	glasses
5779	glassy
5780	gleam
5781	glimmer
5782	global
5783	global warming
5784	globalisation
5785	globally
5786	globe
5787	gloomy
5788	glorious
5789	glory
5790	glory in
5791	glossy
5792	glove
5793	gloves
5794	glow
5795	glowing
5796	glue
5797	glue stick
5798	go
5799	go aboard
5800	go about
5801	go abroad
5802	go after
5803	go against
5804	go against sb./sth.
5805	go ahead
5806	go ahead (one) space
5807	go ahead with
5808	go along (the street)
5809	go around
5810	go away
5811	go back
5812	go back (two) spaces
5813	go back to
5814	go beyond
5815	go boating
5816	go by
5817	go camping
5818	go climbing
5819	go cycling
5820	go deep into mountains
5821	go down
5822	Go down this street. Turn left at the traffic lights.
5823	go down well
5824	go far beyond ...
5825	go fishing
5826	go for
5827	go for a bicycle ride
5828	go for a picnic
5829	go for a walk
5830	go for it
5831	go for sth
5832	go for walks
5833	go hiking
5834	go home
5835	go hunting
5836	go ice-skating
5837	go in
5838	go into
5839	go into detail(s)
5840	go into details
5841	go into hiding
5842	go mad
5843	go mountain climbing
5844	go mountaineering
5845	go off
5846	go on
5847	go on a diet
5848	go on a picnic
5849	go on a trip
5850	go on circuit
5851	go on doing
5852	go on holiday
5853	go on(a picnic)
5854	go out
5855	go out for a picnic
5856	go out of one's way
5857	go out of style
5858	go out to sb.
5859	go outside
5860	go over
5861	go over to
5862	go past
5863	go past/by ...
5864	go running
5865	go sailing
5866	go shopping
5867	go sightseeing
5868	go skating
5869	go skiing
5870	go straight
5871	go straight on
5872	go swimming
5873	go through
5874	go through sth.
5875	go to
5876	Go to (your desk).
5877	go to a drawing club
5878	go to bed
5879	go to college
5880	go to hospital
5881	go to jail
5882	go to prison
5883	go to school
5884	go to sleep
5885	go to the beach
5886	go to the cinema
5887	go to the dentist
5888	go to the movies
5889	go to the park
5890	go to the supermarket
5891	go to the zoo
5892	go to the/a doctor
5893	go to waste sth.
5894	go to work
5895	go up
5896	go up to
5897	go well
5898	go well with
5899	go with
5900	go wrong
5901	goal
5902	goalkeeper
5903	goat
5904	gobble
5905	god
5906	God
5907	goddess
5908	goes
5909	going about
5910	going to
5911	gold
5912	gold medal
5913	gold mine
5914	golden
5915	golden throne
5916	goldfish
5917	goldsmith
5918	golf
5919	golfer
5920	Gombe National Park
5921	gone
5922	Goneril
5923	good
5924	Good (Nice, Glad) to see you again!
5925	good afternoon
5926	Good afternoon!
5927	Good afternoon.
5928	good at
5929	Good evening!
5930	Good evening.
5931	Good for you!
5932	good friends
5933	good idea
5934	Good idea!
5935	good job
5936	Good job!
5937	good luck
5938	Good luck!
5939	good manners
5940	good morning
5941	Good morning!
5942	Good morning, class.
5943	Good morning.
5944	Good night.
5945	Good point.
5946	Good/Great work!
5947	goodbye
5948	good-bye
5949	Goodbye.
5950	good-looking
5951	good-natured
5952	goodness
5953	goods
5954	goodwill
5955	Goodwill Ambassador
5956	goose
5957	gorge
5958	gorge (oneself)
5959	gorgeous
5960	gorilla
5961	gospel
5962	gossip
5963	gossip column
5964	got
5965	got a poor grade
5966	got up
5967	Gothic
5968	govern
5969	governess
5970	government
5971	governor
5972	gown
5973	GPS
5974	grab
5975	grace
5976	Grace
5977	graceful
5978	gracious
5979	graciously
5980	grade
5981	gradual
5982	gradually
5983	graduate
5984	graduation
5985	graffiti
5986	grain
5987	gram
5988	grammar
5989	grammatical
5990	gramophone
5991	grand
5992	Grand Canyon
5993	grand total
5994	grandad
5995	grandchild
5996	grandchildren
5997	granddaughter
5998	grandfather
5999	grandma
6000	grandmother
6001	grandpa
6002	grandparent
6003	grandson
6004	granite
6005	granny
6006	grant
6007	Grant
6008	grape
6009	grapefruit
6010	grapes
6011	graph
6012	graphic
6013	graphical image
6014	graphical user interface
6015	graphics card
6016	graphics processing unit
6017	grasp
6018	grass
6019	grassland
6020	grassy
6021	grateful
6022	gratification
6023	gratitude
6024	grave
6025	gravity
6026	gravy
6027	gray
6028	graze
6029	great
6030	great auk
6031	Great Barrier Reef
6032	Great Great Grandpa
6033	Great Wall
6034	greatest
6035	great-grandma
6036	great-grandpa
6037	greatly
6038	Greece
6039	greed
6040	greedily
6041	greedy
6042	Greek
6043	green
6044	Green
6045	green beans
6046	green tea
6047	green with envy
6048	greengrocer
6049	greengrocer's
6050	greenhouse
6051	greenhouse effect
6052	Greenland
6053	greenwashing
6054	Greenwich
6055	Greenwood Middle School
6056	greet
6057	greet sb. with a smile
6058	greeting
6059	Greg
6060	grew
6061	grey
6062	greyhound
6063	grief
6064	grievance
6065	grieve
6066	Griffin
6067	grill
6068	grin
6069	grind
6070	grindstone
6071	grizzly
6072	groan
6073	grocer
6074	groceries
6075	grocery
6076	grocery cart
6077	grocery list
6078	grocery store
6079	groom
6080	grotto
6081	ground
6082	ground floor
6083	groundhog
6084	Groundhog Day
6085	group
6086	grove
6087	grow
6088	grow crops
6089	grow up
6090	grow(up)
6091	growing
6092	growl
6093	grown
6094	grownup
6095	grown-up
6096	growth
6097	grudgingly
6098	grumble
6099	guarantee
6100	guard
6101	guard against
6102	guard against sth
6103	guardian
6104	Guatemala
6105	guess
6106	guess at sth.
6107	guess what
6108	guessing game
6109	guesswork
6110	guest
6111	Guggenheim Museum
6112	guidance
6113	guide
6114	guidebook
6115	guided
6116	guilt
6117	guilty
6118	Guinness
6119	Guinness Book of World Records
6120	guitar
6121	gulf
6122	gum
6123	gun
6124	gunboat
6125	gunpowder
6126	gutter
6127	guy
6128	Guy Fawkes Day
6129	gym
6130	gymnasium
6131	gymnast
6132	gymnastic
6133	gymnastically
6134	gymnastics
6135	Gypsy
6136	ha
6137	ha ha
6138	habit
6139	habitat
6140	habit-forming
6141	hack
6142	hacker
6143	had
6144	had a cold
6145	had better
6146	had fun with friends
6147	haiku
6148	hail
6149	hailstorm
6150	hair
6151	hair clip
6152	haircut
6153	hairdryer
6154	hairpin
6155	hairstyle
6156	hairy
6157	half
6158	half ... and half ...
6159	half an hour late
6160	half past ...
6161	half-hearted
6162	half-time
6163	halfway
6164	hall
6165	hallow
6166	Halloween
6167	hallway
6168	halt
6169	ham
6170	hamburger
6171	Hamlet
6172	hammer
6173	hamster
6174	hand
6175	hand in
6176	hand out
6177	hand over
6178	hand sth. to sb.
6179	handbag
6180	handclap
6181	hand-feed
6182	handful
6183	handicapped
6184	handicraft
6185	handkerchief
6186	handle
6187	handmade
6188	hand-made
6189	handrail
6190	Hands up!
6191	handsome
6192	hand-wash
6193	handwriting
6194	handy
6195	hang
6196	hang glider
6197	hang on
6198	hang on a second
6199	hang out
6200	hang up
6201	Hang up the (dress).
6202	hang up(your clothes)
6203	hanging
6204	Hangzhou National Tea Museum
6205	Hannibal
6206	Hans Braun
6207	Hansel and Gretel
6208	happen
6209	happen (to)
6210	happen to
6211	happen to sb.
6212	happened
6213	happening
6214	happily
6215	happiness
6216	happy
6217	Happy birthday!
6218	Happy Birthday!
6219	happy clown
6220	Happy New Year!
6221	harbor
6222	harbour
6223	hard
6224	hard copy
6225	hard disk
6226	hard-boiled
6227	harden
6228	harder
6229	hardly
6230	hardly ever
6231	hardship
6232	hardware
6233	hard-wearing
6234	hardworking
6235	hard-working
6236	hare
6237	Hari
6238	harm
6239	harmful
6240	harmless
6241	harmonica
6242	harmony
6243	harness
6244	harp
6245	harpoon
6246	Harry Potter
6247	harsh
6248	Harvard
6249	harvest
6250	has
6251	has got
6252	has to, have to
6253	hasn't (got)
6254	haste
6255	hastily
6256	hasty
6257	hat
6258	hat and wand
6259	hatch
6260	hate
6261	hateful
6262	hatred
6263	haunted
6264	have
6265	have (close) ties with
6266	have (some) fun
6267	have (something) in common
6268	have ... class
6269	have ... effect on
6270	have ... in common
6271	have ... off
6272	have a bad effect on
6273	have a big effect on
6274	have a birthday party
6275	have a burst of temper
6276	have a chip on one's shoulder
6277	have a cold
6278	have a cough
6279	have a dream
6280	have a fever
6281	have a gift for
6282	have a go (at)
6283	have a go at
6284	Have a good day!
6285	have a good look at
6286	have a good talk
6287	have a good time
6288	Have a good time!
6289	have a great/good weekend
6290	have a headache
6291	have a look
6292	have a look at
6293	have a match
6294	have a meeting
6295	have a party
6296	have a picnic
6297	have a point
6298	have a population of
6299	have a rest
6300	have a seat
6301	have a sleep
6302	have a stomachache
6303	have a strong link to
6304	have a talk with sb.
6305	have a temperature
6306	have a toothache
6307	have a try
6308	have a very poor chance to do
6309	have access to
6310	have affection for
6311	have an (enormous) influence on
6312	have an effect on
6313	have an eye for
6314	have an influence on
6315	have an interest in
6316	have breakfast
6317	have butterflies in one's stomach
6318	have class
6319	have connection with
6320	have control (over/of ... )
6321	have difficulty (in) doing sth
6322	have difficulty (in) doing sth.
6323	have dinner
6324	have every reason to do something
6325	have faith in
6326	have fun
6327	have fun doing
6328	have fun with
6329	have got
6330	have got to
6331	have influence on
6332	have lessons
6333	have lunch
6334	have meals
6335	have no breakfast
6336	have no choice but to ...
6337	have no choice but to do
6338	have no control (over/of ... )
6339	have no idea
6340	have no interest in
6341	have no luck
6342	have no thoughts of
6343	have no time to do
6344	have no use for
6345	have no way of knowing ...
6346	have nothing to do with
6347	have power over
6348	have several weeks off
6349	have snowball fights
6350	have something at one's fingertips
6351	have something to do with
6352	have sth. in common
6353	have supper
6354	have the confidence to
6355	have the flu
6356	have the pleasure of doing ...
6357	have to
6358	have to do with
6359	have two left feet
6360	have/has
6361	have/take pity on
6362	haven't (got)
6363	having ... class
6364	Hawaii
6365	hay
6366	Hayes
6367	HB
6368	he
6369	He/She is ... (years old).
6370	He/She is ... metres tall.
6371	head
6372	head (straight) for ...
6373	head for
6374	head for ...
6375	head of
6376	head over heels
6377	head teacher
6378	headache
6379	headband
6380	heading
6381	headline
6382	headmaster
6383	headmistress
6384	headphone
6385	headquarters
6386	headset
6387	heal
6388	health
6389	health care
6390	health food
6391	healthily
6392	healthy
6393	hear
6394	hear ... out
6395	hear from
6396	hear of
6397	hear of ...
6398	heard
6399	hearing
6400	heart
6401	heart attack
6402	heartbeat
6403	heartbroken
6404	hearten
6405	heartily
6406	heat
6407	heat up
6408	heather
6409	heating
6410	heaven
6411	heavenly
6412	Heaven's Lake
6413	heavier
6414	heavily
6415	heavy
6416	heavy rain
6417	heavyweight
6418	Hebrew
6419	hectare
6420	hedge
6421	heeheehee
6422	heel
6423	Heidi
6424	height
6425	heighten
6426	heinous
6427	Helen
6428	Helen Keller
6429	helicopter
6430	hello
6431	Hello!
6432	helmet
6433	help
6434	help ( ... ) out
6435	help (sb) with sth
6436	help (sb.) with sth.
6437	help ... with ...
6438	help ...(to) do
6439	help out
6440	help sb with sth
6441	help sb. out
6442	help sick people
6443	help with
6444	help yourself
6445	Help yourself to ...
6446	help yourselves
6447	Help!
6448	helped
6449	helper
6450	helpful
6451	helpless
6452	helplessly
6453	helplessness
6454	helpline
6455	Hemingway
6456	hemisphere
6457	hen
6458	hence
6459	her
6460	herb
6461	herbal
6462	Herculean
6463	herd
6464	here
6465	here and there
6466	Here comes ...
6467	here is/are ...
6468	Here it is!
6469	Here it is.
6470	here we go
6471	Here we go!
6472	here you are
6473	Here you are.
6474	Here!
6475	hereditary
6476	here's
6477	herewith
6478	heritage
6479	hero
6480	heroic
6481	heroin
6482	heroine
6483	heroism
6484	hers
6485	herself
6486	hertz
6487	he's
6488	hesitant
6489	hesitate
6490	hesitation
6491	hey
6492	hi
6493	Hi.
6494	hibernate
6495	hibernation
6496	hidden
6497	hide
6498	hide-and-seek
6499	hiding
6500	hieroglyphic
6501	hieroglyphics
6502	Higgins
6503	high
6504	high blood pressure
6505	high heels
6506	high jump
6507	high school
6508	high-class
6509	higher
6510	highest
6511	Highgate Cemetery
6512	high-heeled
6513	highlight
6514	highly
6515	high-pitched
6516	high-rise
6517	high-speed
6518	high-tech
6519	highway
6520	hijack
6521	hike
6522	hiking
6523	hilarious
6524	hill
6525	hillside
6526	hilly
6527	him
6528	himself
6529	Hindi
6530	Hindu
6531	hint
6532	hip
6533	hip hop
6534	hip, hip, hooray!
6535	hippo
6536	Hippomenes
6537	hippopotamus
6538	hire
6539	hire oneself out
6540	his
6541	Hispanic
6542	historian
6543	historic
6544	historical
6545	history
6546	hit
6547	hit film
6548	hit song
6549	hits
6550	hitter
6551	HIV
6552	hm
6553	hmm
6554	hmmm ...
6555	hoarfrost
6556	hoarse
6557	hoax
6558	Hobart
6559	hobbit
6560	hobby
6561	hockey
6562	hold
6563	hold a competition
6564	hold a great interest
6565	hold a meeting
6566	hold back
6567	hold competition in poetry
6568	hold fast to
6569	hold on
6570	hold on to
6571	hold one's breath
6572	hold one's ground
6573	hold onto
6574	hold out
6575	hold sb. over
6576	hold the post of
6577	hold to ...
6578	hold true
6579	hold up
6580	holder
6581	hole
6582	holiday
6583	holiday entitlement
6584	Holland
6585	holler
6586	hollow
6587	Holly
6588	Hollywood
6589	holy
6590	home
6591	home and abroad
6592	home cinema
6593	home page
6594	Home Science
6595	home town
6596	homeland
6597	homeless
6598	homelessness
6599	home-made
6600	homeroom
6601	homeroom teacher
6602	homesickness
6603	homestay
6604	hometown
6605	homework
6606	homosexual
6607	honest
6608	honestly
6609	honesty
6610	Honesty truly is the best policy.
6611	honey
6612	honeycomb
6613	honeymoon
6614	honeysuckle
6615	Hong Kong
6616	honk
6617	honor
6618	honour
6619	hood
6620	hoof
6621	hook
6622	hoop
6623	hooray
6624	hop
6625	hope
6626	hopeful
6627	hopefully
6628	hopeless
6629	Horace
6630	horizon
6631	horizontal
6632	hormone
6633	horn
6634	hornbeam
6635	horrendous
6636	horrible
6637	horrify
6638	horror
6639	horror film
6640	horse
6641	horseback riding
6642	horse-drawn
6643	horsemanship
6644	horse-rider
6645	horse-riding
6646	horseshoe
6647	horseshoe-shaped
6648	hose
6649	hospitable
6650	hospital
6651	hospitality
6652	host
6653	hostel
6654	hostess
6655	hostile
6656	hostility
6657	hot
6658	hot dog
6659	hot pot
6660	hotdog
6661	hotel
6662	hotpot
6663	hound
6664	hour
6665	house
6666	household
6667	housewarming
6668	housewife
6669	housework
6670	housing
6671	Houston
6672	Houston Rockets
6673	hover
6674	hoverboard
6675	how
6676	how about ...
6677	How about ...?
6678	How are you?
6679	How can we get there?
6680	How come?
6681	How do you do?
6682	How do you feel?
6683	How far is it from ... to ...?
6684	How is ... going?
6685	How is the weather? It is ...
6686	how long
6687	how many
6688	How many ... (are there)?
6689	How many ...?
6690	How many colours do you see?
6691	How many?
6692	how much
6693	How much ...?
6694	How much is/are/for ...?
6695	How nice!
6696	how old
6697	How old ...?
6698	How old are you?
6699	How old is he/she?
6700	How tall are you?
6701	How tall is he/she?
6702	however
6703	howl
6704	how-to
6705	http Hypertext Transfer Protocol
6706	Huangguoshu Waterfall
6707	Hubert Hudson
6708	Huckleberry Finn
6709	hug
6710	huge
6711	hula hooping
6712	hum
6713	human
6714	human being
6715	human race
6716	human resources
6717	humanistic
6718	humanitarian
6719	humanity
6720	humankind
6721	humble
6722	humbug
6723	humid
6724	humming-bird
6725	humorist
6726	humorous
6727	humour
6728	hundred
6729	hundreds of
6730	hung
6731	hunger
6732	hungry
6733	hunt
6734	Hunt
6735	hunted
6736	hunter
6737	hurdle
6738	hurdles
6739	hurdling
6740	hurray
6741	hurricane
6742	hurry
6743	hurry up
6744	Hurry up!
6745	Hurry up.
6746	hurt
6747	husband
6748	hush
6749	husky
6750	Hussey
6751	hut
6752	hybrid
6753	hybrid rice
6754	Hyde Park
6755	hydro-electric
6756	hydroelectricity
6757	hydrogen
6758	hyperlink
6759	hypocritical
6760	hysteria
6761	I
6762	I bet
6763	I can't wait!
6764	I dare you ...
6765	I don't like
6766	I have a headache.
6767	I have a stomachache.
6768	I hope so.
6769	I like
6770	I see.
6771	I think so.
6772	I will take it.
6773	I would like ...
6774	I would love ...
6775	ibis
6776	ice
6777	Ice and Snow Festival
6778	ice cap
6779	ice cream
6780	ice cream cone
6781	ice fishing
6782	ice hockey
6783	ice lantern
6784	ice skate
6785	iceberg
6786	ice-cream
6787	Iceland
6788	ice-skate
6789	icon
6790	ICT
6791	icy
6792	ID
6793	ID card
6794	I'd like
6795	I'd like ...
6796	I'd like to ...
6797	I'd love to
6798	idea
6799	ideal
6800	idealism
6801	idealistic
6802	identical
6803	identification
6804	identifier
6805	identify
6806	identify oneself with ...
6807	identify with
6808	identity
6809	idiom
6810	idiomatic
6811	IEEE 1394 port
6812	IELTS
6813	if
6814	if necessary
6815	if only
6816	if only ...
6817	ignition
6818	ignorance
6819	ignorant
6820	ignore
6821	ill
6822	I'll
6823	I'll take it.
6824	illegal
6825	illegally
6826	ill-fitting
6827	illiteracy
6828	illness
6829	ill-treated
6830	illusion
6831	illustrate
6832	illustration
6833	illustrator
6834	I'm
6835	I'm ... (years old).
6836	I'm ... metres tall.
6837	I'm afraid
6838	I'm afraid I can't afford it.
6839	I'm doing well.
6840	I'm fine, thank you.
6841	I'm fine, thanks.
6842	I'm fine. And you?
6843	I'm home.
6844	I'm sorry to hear that.
6845	I'm ten years old.
6846	I'm/I feel ...
6847	image
6848	imaginary
6849	imagination
6850	imaginative
6851	imagine
6852	Imagine
6853	imaginings
6854	imbalance
6855	imbue
6856	imitate
6857	imitation
6858	immeasurable
6859	immediacy
6860	immediate
6861	immediately
6862	immense
6863	immigrant
6864	immigrate
6865	immigration
6866	immoral
6867	immortality
6868	immune
6869	immune system
6870	immunity
6871	impact
6872	impact printer
6873	impair
6874	impatient
6875	impatiently
6876	imperative
6877	imperfection
6878	imperial
6879	implement
6880	implication
6881	imply
6882	impolite
6883	import
6884	importance
6885	important
6886	importantly
6887	impose
6888	impossible
6889	impress
6890	impress upon
6891	impressed
6892	impression
6893	impressionism
6894	Impressionism
6895	impressionist
6896	Impressionist Movement
6897	impressive
6898	imprison
6899	imprisonment
6900	improper
6901	improve
6902	improvement
6903	improvisation
6904	improvise
6905	impulse
6906	impulsive
6907	in
6908	in a ... voice
6909	in a flash
6910	in a human way
6911	in a hurry
6912	in a hurry to do ...
6913	in a low voice
6914	in a minute
6915	in a nutshell
6916	in a positive way
6917	in a row
6918	in a rush
6919	in a second
6920	in a sharp contrast
6921	in a short time
6922	in a trembling voice
6923	in a very general way
6924	in a way
6925	in a word
6926	in a(n) ... manner
6927	in accordance with
6928	in addition
6929	in addition to
6930	in advance
6931	in agreement with ...
6932	in aid of
6933	in all
6934	in all directions
6935	in amazement
6936	in an instant
6937	in ancient times
6938	in any walk of life
6939	in astonishment
6940	in authority
6941	in balance
6942	in black and white
6943	in brief
6944	in case
6945	in case of
6946	in cash
6947	in celebration of
6948	in chaos
6949	in charge
6950	in charge of
6951	in class
6952	in closing
6953	in college
6954	in common
6955	in comparison
6956	in comparison with
6957	in concert
6958	in conclusion
6959	in contrast
6960	in contrast to
6961	in danger
6962	in danger (of)
6963	in danger of
6964	in debt
6965	in defence of
6966	in detail
6967	in different ways
6968	in disbelief
6969	in disguise
6970	in doubt
6971	in English
6972	in excellent condition
6973	in fact
6974	in fashion
6975	in favour of
6976	in fear
6977	in fear of
6978	in fear of one's life
6979	in force
6980	in front of
6981	in front of ...
6982	in general
6983	in good condition
6984	in good health
6985	in good spirits
6986	in grace
6987	in great detail
6988	in great disturbance
6989	in half
6990	in harmony
6991	in harmony with
6992	in high spirits
6993	in history
6994	in honour of
6995	in hospital
6996	in jail
6997	in length
6998	in line
6999	in line with
7000	in many cases
7001	in many ways
7002	in memory of
7003	in memory of sb.
7004	in motion
7005	in my opinion
7006	in my view
7007	in need
7008	in need of
7009	in no time
7010	in no time at all
7011	in normal health
7012	in one go
7013	in one hour
7014	in one's free time
7015	in one's memory
7016	in one's opinion
7017	in one's prime
7018	in one's spare time
7019	in one's turn
7020	in one's view
7021	in one's way
7022	in order
7023	in order to
7024	in order to do something
7025	in order to do sth.
7026	in other words
7027	in pairs
7028	in particular
7029	in passing
7030	in peace
7031	in person
7032	in pieces
7033	in place
7034	in poor condition
7035	in possession of
7036	in practice
7037	in print
7038	in prison
7039	in public
7040	in public transport
7041	in rags
7042	in reality
7043	in recent years
7044	in regard to
7045	in relief
7046	in response to
7047	in return
7048	in revenge
7049	in ruins
7050	in sb's presence
7051	in search of
7052	in search of ...
7053	in season
7054	in seconds
7055	in session
7056	in shame
7057	in shape
7058	in shock
7059	in short
7060	in short supply
7061	in sight
7062	in silence
7063	in some aspect
7064	in some way
7065	in some ways
7066	in some/a sense
7067	in spite of
7068	in spots
7069	in such a hurry
7070	in surprise
7071	in terms of
7072	in terms of ...
7073	in that
7074	in that case
7075	in that particular situation
7076	in the 1860s
7077	in the afternoon
7078	in the air
7079	in the area of
7080	in the beginning
7081	in the blink of an eye
7082	in the bottom of ...
7083	in the case of
7084	in the center of
7085	in the centre of
7086	in the classroom
7087	in the corner
7088	in the countryside
7089	in the course of
7090	in the days that followed
7091	in the daytime
7092	in the depths of winter
7093	in the development of ...
7094	in the distance
7095	in the early days
7096	in the east of
7097	in the end
7098	in the evening
7099	in the face of
7100	in the field of
7101	in the field of ...
7102	in the first round
7103	in the flesh
7104	in the following days
7105	in the following weeks
7106	in the form of
7107	in the future
7108	in the history of
7109	in the light of
7110	in the long run
7111	in the long term
7112	in the meantime
7113	in the middle
7114	in the middle of
7115	in the midst of ...
7116	in the morning
7117	in the name of
7118	in the north of
7119	in the north-west of
7120	in the open
7121	in the open air
7122	in the original
7123	in the park
7124	in the past
7125	in the presence of ...
7126	in the present
7127	in the shadow
7128	in the shape of
7129	in the sky
7130	in the south of
7131	in the sun
7132	in the wild
7133	in the woods
7134	in the/one's dream
7135	in theory
7136	in this day and age
7137	in this respect
7138	in time
7139	in times of
7140	in top form
7141	in total
7142	in trouble
7143	in truth
7144	in tune
7145	in turn
7146	in two minutes
7147	in urgent need of ...
7148	in use
7149	in vain
7150	in view of
7151	in weight
7152	in whispers
7153	in your dreams
7154	inability
7155	inadequate
7156	inappropriate
7157	inc.
7158	Inca Empire
7159	incapable
7160	incense
7161	incentive
7162	inch
7163	incident
7164	include
7165	including
7166	inclusion
7167	income
7168	income stream
7169	incompetence
7170	incompetent
7171	incomplete
7172	incongruity
7173	incongruous
7174	inconsiderate
7175	inconvenience
7176	inconvenient
7177	incorrect
7178	incorrectly
7179	increase
7180	increasing
7181	increasingly
7182	incredible
7183	incredibly
7184	indeed
7185	independence
7186	Independence Day
7187	independent
7188	independently
7189	indescribably
7190	index
7191	India
7192	Indian
7193	Indian Ocean
7194	indicate
7195	indication
7196	indicator
7197	indifference
7198	indifferent
7199	indifferently
7200	indigenous
7201	indigo
7202	indirect
7203	indirectly
7204	indispensable
7205	individual
7206	individualism
7207	individuality
7208	Indonesia
7209	Indonesian
7210	indoor
7211	indoor sports
7212	indoors
7213	indulge
7214	industrial
7215	industrialisation
7216	industrialist
7217	industrialize
7218	industrialized countries
7219	industry
7220	ineffective
7221	inefficient
7222	inequality
7223	inertia
7224	inescapable
7225	inevitable
7226	inexpensive
7227	infamous
7228	infantile paralysis
7229	infantryman
7230	infect
7231	infection
7232	infectious
7233	inferior
7234	inflation
7235	infliction
7236	influence
7237	influential
7238	influenza
7239	inform
7240	informal
7241	informally
7242	information
7243	Information Centre
7244	information processing cycle
7245	informative
7246	informer
7247	infrastructure
7248	infuriate
7249	ingredient
7250	inhabit
7251	inhabitant
7252	inherently
7253	inherit
7254	inheritance
7255	inhospitable
7256	inhumanity
7257	initial
7258	initially
7259	initiate
7260	initiative
7261	inject
7262	injection
7263	injure
7264	injured
7265	injured cat
7266	injury
7267	injustice
7268	ink
7269	inlaid
7270	inland
7271	in-law
7272	inlet
7273	in-line skates
7274	inn
7275	inner
7276	innermost
7277	innocence
7278	innocent
7279	innovation
7280	innovative
7281	innovatively
7282	input
7283	input device
7284	inquiry
7285	inquisitive
7286	insane
7287	insatiable
7288	inscribe
7289	insect
7290	insect museum
7291	insecticide
7292	insecure
7293	insensible
7294	insensitive
7295	inseparable
7296	insert
7297	insertion point
7298	inside
7299	insight
7300	insignificant
7301	insist
7302	insist on
7303	insist on ...
7304	insist on sth.
7305	inspect
7306	inspection
7307	inspector
7308	inspiration
7309	inspirational
7310	inspire
7311	inspiring
7312	install
7313	installing
7314	instalment
7315	instance
7316	instant
7317	instant message
7318	instant messaging
7319	instant messenging
7320	instantly
7321	instead
7322	instead of
7323	instead of ...
7324	institute
7325	institution
7326	instruct
7327	instruction
7328	instructions
7329	instructive
7330	instructor
7331	instrument
7332	instrumental
7333	insult
7334	insulting
7335	insurance
7336	insure
7337	intact
7338	intangible
7339	Integrated Services Digital Network
7340	integration
7341	integrity
7342	intellect
7343	intellectual
7344	intellectual property
7345	intelligence
7346	intelligent
7347	intelligently
7348	intelligible
7349	intend
7350	intend to do sth.
7351	intended
7352	intense
7353	intensely
7354	intensity
7355	intention
7356	interact
7357	interaction
7358	intercultural
7359	interdependence
7360	interest
7361	interested
7362	interested in
7363	interest-free no-deposit deal
7364	interesting
7365	interfere
7366	interfere with
7367	interior
7368	interior decorator
7369	intermediate
7370	intermission
7371	internal
7372	internal modem
7373	international
7374	International Children's Day
7375	International Labor Day
7376	International Monetary Fund
7377	International Museum of Toilets
7378	international space station
7379	International Workers' Day
7380	Internet
7381	Internet cafe
7382	Internet Corporation for Assigned Names and Numbers
7383	Internet protocol address
7384	Internet2
7385	interpersonal
7386	interplanetary
7387	interpret
7388	interpretation
7389	interpreter
7390	interrelate
7391	interrogation
7392	interrupt
7393	interstate
7394	interval
7395	interview
7396	interviewee
7397	interviewer
7398	intestine
7399	intimate
7400	into
7401	intolerable
7402	intonation
7403	intriguing
7404	introduce
7405	introduce ... to ...
7406	introduction
7407	introvert
7408	intrude
7409	intrude into ...
7410	Inuit
7411	invade
7412	invader
7413	invalid
7414	invaluable
7415	invasion
7416	invasive
7417	invent
7418	invented
7419	invention
7420	inventive
7421	inventor
7422	invest
7423	investigate
7424	investigation
7425	investigative
7426	investment
7427	investment property
7428	investor
7429	invisible
7430	invitation
7431	invite
7432	invited
7433	inviting
7434	involve
7435	involved
7436	involvement
7437	inwardly
7438	IP address
7439	iPad
7440	iPhone
7441	iPod
7442	IQ
7443	Iran
7444	IrDA
7445	IrDA port
7446	Ireland
7447	Irish
7448	iron
7449	ironic
7450	irony
7451	irregular
7452	irrelevant
7453	irresistible
7454	irrigate
7455	irrigation
7456	irritable
7457	irritate
7458	irritation
7459	is
7460	Isaac Asimov
7461	Isaac Newton
7462	ISDN
7463	Islamic
7464	island
7465	isn't
7466	isolate
7467	isolated
7468	Israeli
7469	issue
7470	it
7471	IT
7472	It can be said that ...
7473	It is a great season for ...
7474	It is no wonder that ...
7475	It is obvious that ...
7476	it is really convenient for sb. to do sth.
7477	It is said that ...
7478	it is up to sb. to do sth.
7479	It is well known that ...
7480	It was not until ... that
7481	Italian
7482	italics
7483	Italy
7484	item
7485	Ithaca
7486	itinerant
7487	its
7488	it's
7489	It's (widely) believed that ...
7490	It's ... away from ...
7491	It's ... blocks (away) from ...
7492	It's a great pity that ...
7493	It's my pleasure.
7494	It's one's duty to ...
7495	It's one's turn to ...
7496	It's pleasant to do ...
7497	It's time for ...
7498	It's time to/for ...
7499	itself
7500	I've
7501	ivory
7502	J.K. Rowling
7503	J.K. Rowling
7504	Jabez Wilson
7505	Jack
7506	jacket
7507	jacket and boots
7508	jack-o'-lantern
7509	Jackson
7510	Jacob Marley
7511	jade pendant
7512	jail
7513	Jake
7514	jam
7515	Jamaica
7516	Jamaican
7517	James
7518	James Dyson
7519	James Naismith
7520	Jamie
7521	Jan Hasek
7522	Jan.
7523	Jane
7524	Jane Austin
7525	Jane Goodall
7526	Janice
7527	Janson
7528	January
7529	Japan
7530	Japanese
7531	jar
7532	jasmine
7533	Jason
7534	Jason Glen
7535	javelin
7536	jaw
7537	jaws
7538	jaws of death
7539	jazz
7540	jazz band
7541	jealous
7542	jealousy
7543	Jean
7544	jeans
7545	jeep
7546	Jeff
7547	jelly
7548	jellyfish
7549	Jem
7550	Jenny
7551	jerboa
7552	Jeremy
7553	jerk
7554	Jerry
7555	Jessica
7556	jester
7557	Jesus
7558	jet
7559	jet lag
7560	jet-ski
7561	Jew
7562	jewel
7563	jeweled
7564	jewellery
7565	jewellry
7566	jewelry
7567	jewelry designer
7568	Jewish
7569	jiaozi
7570	Jill
7571	Jim
7572	Jimmy
7573	jingle
7574	Joan of Arc
7575	job
7576	Jody Williams
7577	Joe
7578	jog
7579	jogger
7580	jogging
7581	Johann Webber
7582	Johannesburg
7583	John
7584	John Lennon
7585	Johnny
7586	join
7587	join forces
7588	join in
7589	join up
7590	joint
7591	joke
7592	joke around
7593	jokingly
7594	jolly
7595	Jones
7596	Jordan
7597	Joseph Banks
7598	jot
7599	jot down
7600	jot sth. down (on)
7601	journal
7602	journalism
7603	journalist
7604	journey
7605	Journey to the West
7606	joust
7607	joy
7608	joyful
7609	joyously
7610	joystick
7611	JPEC
7612	Jr.
7613	judge
7614	judgement
7615	judge's gavel
7616	Judy
7617	juggle
7618	juggler
7619	juice
7620	juicy
7621	Jul.
7622	Julie
7623	July
7624	jump
7625	jump down
7626	jump in
7627	jump into
7628	jump out
7629	jump rope
7630	jump up
7631	Jump.
7632	jumped
7633	jumped rope
7634	jumper
7635	jumping
7636	jumping jack
7637	jumping rope
7638	Jumping rope
7639	jump-start
7640	Jun.
7641	June
7642	jungle
7643	jungle gym
7644	jungle gyms
7645	junior
7646	junior college
7647	junior high
7648	junior high (school)
7649	junior high school
7650	junior middle school
7651	junk
7652	junk food
7653	Junko Tabei
7654	Jupiter
7655	Jurassic Park
7656	jury
7657	just
7658	just a minute
7659	just like
7660	just right
7661	just then
7662	justice
7663	justifiably
7664	Kaiser
7665	Kakado
7666	Kakadu
7667	kaleidoskope
7668	kangaroo
7669	karaoke
7670	Karen
7671	Kate
7672	Katie
7673	KBps
7674	kebab
7675	keen
7676	keep
7677	keep (on) doing sth
7678	keep ... alive
7679	keep ... away from
7680	keep ... free from/of
7681	keep ... from ...
7682	keep ... in mind
7683	keep ... in order
7684	keep ... off
7685	keep ... to oneself
7686	keep ... up to
7687	keep a diary
7688	keep a good diet
7689	keep a secret
7690	keep a sharp eye on
7691	keep accounts
7692	keep an appointment
7693	keep an eye out for
7694	keep away
7695	keep away from
7696	keep body and soul together
7697	keep clear of ...
7698	keep coming back
7699	keep cool
7700	keep doing ...
7701	keep each other at arm's length
7702	keep fit
7703	keep from doing ...
7704	keep in touch
7705	keep in touch with
7706	keep in touch with ...
7707	keep in touch with sb./sth.
7708	keep it secret
7709	keep it up
7710	keep off
7711	keep on
7712	keep on (doing)
7713	keep on doing
7714	keep on doing sth.
7715	keep one's balance
7716	keep one's cool
7717	keep one's eye on
7718	keep one's eyes on
7719	keep one's eyes on sb./sth.
7720	keep one's head bent
7721	keep one's nose to the grindstone
7722	keep one's promise
7723	keep one's word
7724	keep oneself warm
7725	keep pace with
7726	keep quiet
7727	keep records
7728	keep records by ...
7729	keep sb from sth
7730	keep sb. from (doing) sth.
7731	keep sb./sth. away
7732	keep sb./sth. in mind
7733	keep silent
7734	keep someone company
7735	keep something in order
7736	keep still
7737	keep to
7738	keep to the right
7739	keep up
7740	keep up to date
7741	keep up with
7742	keep your desk clean
7743	keeper
7744	Kelly
7745	Ken
7746	Kent
7747	Kenya
7748	kernel
7749	kettle
7750	Kevin
7751	key
7752	key ring
7753	keyboard
7754	keyword
7755	keywords
7756	kg
7757	kick
7758	kick sb. off
7759	kicking
7760	kid
7761	kidnap
7762	kidnapping
7763	kidney
7764	kill
7765	kill time
7766	killed
7767	killer shark
7768	kilo
7769	kilobyte
7770	kilogram
7771	kilometer
7772	kilometre
7773	Kim
7774	kimono
7775	kind
7776	kind of
7777	kindergarten
7778	kind-hearted
7779	kindness
7780	king
7781	King Lear
7782	kingdom
7783	kingfisher
7784	kiss
7785	kit
7786	kitchen
7787	kite
7788	kitten
7789	Kitty
7790	kiwi
7791	km
7792	knapsack
7793	knee
7794	kneel
7795	knew
7796	knife
7797	knife, fork and spoon
7798	knight
7799	knock
7800	knock ... over
7801	knock down
7802	knock into
7803	knock into sb.
7804	knock on
7805	knock on / (at) the door
7806	knock on the door
7807	knock out
7808	knock over
7809	knock sb. over
7810	knot
7811	know
7812	know about sth.
7813	knowledge
7814	knowledgeable
7815	known
7816	known as
7817	knuckle
7818	koala
7819	Kobe
7820	Königsberg
7821	Korea
7822	Korean
7823	Kosciuszko
7824	kowtow
7825	Krista
7826	kung fu
7827	Kung Fu Panda
7828	L
7829	L.A. Lakers
7830	lab
7831	label
7832	labor
7833	laboratory
7834	laborer
7835	labour
7836	Labour Day
7837	lace
7838	lack
7839	lack of
7840	lacking
7841	ladder
7842	ladies and gentlemen
7843	ladle
7844	ladle out
7845	lady
7846	ladybird
7847	lake
7848	Lake Ontario
7849	Lake Superior
7850	Lake Taupo
7851	Lake Titicaca
7852	lamb
7853	lame
7854	lamp
7855	land
7856	land on one's feet
7857	landau
7858	lander
7859	landfill
7860	landing
7861	landing site
7862	landlord
7863	landmark
7864	landmine
7865	landowner
7866	landscape
7867	landslide
7868	lane
7869	language
7870	lantern
7871	Lantern Festival
7872	Laos
7873	Laotian
7874	lap
7875	laptop
7876	large
7877	large numbers of ...
7878	large quantities of
7879	large sums of money
7880	largest
7881	lark
7882	Larry
7883	Larry Belmont
7884	laser
7885	lass
7886	last
7887	last but not least
7888	last name
7889	last night
7890	last word
7891	lasting
7892	lastly
7893	late
7894	late in the fall
7895	lately
7896	late-night
7897	later
7898	later on
7899	latest
7900	Latin
7901	latitude
7902	latter
7903	laugh
7904	laugh at
7905	laughed
7906	laughter
7907	launch
7908	launch into
7909	laundry
7910	Laura
7911	Lausanne
7912	lava
7913	lavish
7914	law
7915	lawful
7916	lawn
7917	lawn mower
7918	lawyer
7919	lay
7920	lay a good foundation for
7921	lay eggs
7922	lay off
7923	lay out
7924	lay sb. off
7925	lay the foundation for
7926	lay the table
7927	layer
7928	layout
7929	laziness
7930	lazy
7931	LCD
7932	LCD monitor
7933	lead
7934	lead (sb.) to
7935	lead ... into
7936	lead ... to
7937	lead a ... life
7938	lead into ...
7939	lead the way
7940	lead the way to
7941	lead to
7942	leader
7943	leading
7944	leaf
7945	leaflet
7946	leafy
7947	league
7948	leak
7949	leak out
7950	leaky
7951	lean
7952	lean against ...
7953	lean on/upon
7954	leap
7955	leap year
7956	leaping
7957	learn
7958	learn about
7959	learn about sth.
7960	learn from
7961	learn from each other
7962	learn from sb./sth.
7963	learned
7964	learned to ride a bike
7965	learned to swim
7966	learned to walk
7967	learnt
7968	least
7969	leather
7970	leave
7971	leave ... alone
7972	leave ... behind
7973	leave behind
7974	leave class
7975	leave entitlement
7976	leave for
7977	leave off
7978	leave out
7979	leave school
7980	leave sth. behind (sb.)
7981	leave sth.behind
7982	leaves
7983	Lebanon
7984	lecture
7985	lecturer
7986	ledge
7987	left
7988	left-handed
7989	leftover
7990	lefty
7991	leg
7992	legacy
7993	legal
7994	legend
7995	legendary
7996	legislation
7997	legitimate
7998	legs
7999	leisure
8000	lemon
8001	lemonade
8002	lend
8003	lending institution
8004	length
8005	lengthen
8006	lengthwise
8007	Leningrad
8008	Leonardo da Vinci
8009	leopard
8010	less
8011	less and less
8012	less than
8013	lessen
8014	lesson
8015	Lester
8016	let
8017	let ... down
8018	let ... go
8019	let alone
8020	let down
8021	let go (of)
8022	let go of
8023	let me see
8024	Let me see.
8025	let off
8026	let on
8027	let out
8028	let out a cry
8029	let sb. down
8030	let somebody down
8031	let sth./sb. go
8032	let's
8033	Let's ...
8034	Let's be friends.
8035	let's go
8036	Let's play a game!
8037	Let's see.
8038	letter
8039	lettuce
8040	level
8041	lexicographer
8042	Lia
8043	liar
8044	liberalise
8045	liberation
8046	liberty
8047	librarian
8048	library
8049	library card
8050	licence
8051	license
8052	lichen
8053	licked
8054	lid
8055	lie
8056	lie ahead
8057	lie around
8058	lie down
8059	lie in
8060	lie on one's back
8061	lie on the ground
8062	lie with
8063	life
8064	life expectancy
8065	life jacket
8066	lifeboat
8067	lifeguard
8068	lifeless
8069	lifelike
8070	lifeline
8071	lifelong
8072	life-saving
8073	lifestyle
8074	lifetime
8075	lift
8076	lift off
8077	lift up
8078	light
8079	light blue
8080	light bulb
8081	light pen
8082	light up
8083	light year
8084	light-colored
8085	lighten
8086	lightening
8087	lighter
8088	lightheaded
8089	light-headedness
8090	lighting
8091	lightly
8092	lightness
8093	lightning
8094	like
8095	likeable
8096	likely
8097	likewise
8098	lilac
8099	lily
8100	Lily
8101	Lima
8102	limb
8103	limestone
8104	limit
8105	limitation
8106	limited
8107	limousine
8108	limp
8109	Linda
8110	line
8111	line ... up
8112	line graph
8113	line of work
8114	line up
8115	lines
8116	linguist
8117	linguistic
8118	linguistics
8119	link
8120	link ... to ...
8121	link up
8122	Linux
8123	lion
8124	lion dance
8125	Lionel Greenstreet
8126	lip
8127	lipstick
8128	liquid
8129	liquidity
8130	Lisa
8131	list
8132	listen
8133	listen to
8134	listen to ...
8135	listen to a song
8136	listen to music
8137	listen (to)
8138	listened
8139	listened to music
8140	listener
8141	listening to music
8142	literally
8143	literary
8144	literature
8145	litre
8146	litter
8147	litterbug
8148	little
8149	little by little
8150	little more than
8151	Little Red Riding Hood
8152	Little Women
8153	little-known
8154	live
8155	live in a tent
8156	live off
8157	live off (something)
8158	live on
8159	live out
8160	live out sth.
8161	live through
8162	live up to
8163	liveable
8164	lived
8165	livelihood
8166	liveliness
8167	lively
8168	liver
8169	Liverpool
8170	lives
8171	livestock
8172	living
8173	living organism
8174	living room
8175	lizard
8176	load
8177	loads
8178	loaf
8179	loan
8180	loan finance
8181	lobby
8182	local
8183	local colour
8184	locate
8185	located
8186	located in
8187	location
8188	loch
8189	Loch Ness
8190	Loch Ness Monster
8191	lock
8192	lock out
8193	lock up
8194	locked
8195	locker
8196	lofty
8197	log
8198	log and nest
8199	log off
8200	log on
8201	log onto
8202	logical
8203	logical operations
8204	logically
8205	logo
8206	lollipop
8207	lolly
8208	London
8209	London Eye
8210	London Heathrow Airport
8211	London Zoo
8212	loneliness
8213	lonely
8214	long
8215	long ago
8216	long before
8217	long for
8218	long jump
8219	long long ago
8220	long race
8221	long-eared
8222	longer
8223	longevity
8224	longing
8225	longitude
8226	long-lasting
8227	long-nosed
8228	long-range carrier rocket
8229	long-term
8230	look
8231	look about
8232	look after
8233	look ahead
8234	look around
8235	look around for
8236	look around ( ... )
8237	look at
8238	look at ...
8239	look at sth.
8240	look away from
8241	look back
8242	look back (on)
8243	look back at
8244	look back over one's shoulder
8245	look behind
8246	look blue
8247	look cool
8248	look cute
8249	look different
8250	look down at
8251	look down on
8252	look down upon/on
8253	look for
8254	look for sb./sth.
8255	look forward to
8256	look forward to ...
8257	look funny
8258	look into
8259	look like
8260	look on the bright side
8261	look one's best
8262	look out
8263	look out for
8264	look out of
8265	Look out!
8266	look right at
8267	look sb. in the eye
8268	look sb. up and down
8269	look so pretty
8270	look somebody in the eye(s)
8271	look sth. up
8272	look straight into one's eyes
8273	look through
8274	look up
8275	look up to
8276	look upon
8277	lookalike
8278	looked
8279	lookout
8280	looks
8281	loop
8282	loose
8283	loose conduct
8284	loose tea
8285	loosen
8286	lord
8287	Lord knows
8288	Lori
8289	lorry
8290	Los Angeles
8291	lose
8292	lose contact with ...
8293	lose face
8294	lose heart
8295	lose interest
8296	lose interest in
8297	lose one's balance
8298	lose one's confidence in doing sth.
8299	lose one's way
8300	lose oneself in ...
8301	lose sight of ...
8302	lose touch with
8303	lose track of
8304	lose weight
8305	loser
8306	loss
8307	lost
8308	Lost and Found
8309	lost and found box
8310	lost and found office
8311	lot
8312	lots of
8313	lots of ...
8314	lotus
8315	loud
8316	loudly
8317	loudness
8318	lounge
8319	lovable
8320	love
8321	love at first sight
8322	Love Me Do
8323	loveliness
8324	lovely
8325	lover
8326	loving
8327	lovingly
8328	low
8329	low-carbon
8330	lower
8331	lowest
8332	loyal
8333	loyalty
8334	LSD
8335	Ltd
8336	Lucas
8337	luck
8338	luckily
8339	lucky
8340	lucky money
8341	Lucy
8342	luggage
8343	Luke
8344	lump
8345	lunar
8346	lunar eclipse
8347	lunar month
8348	lunar probe
8349	lunch
8350	lunch box
8351	lunch break
8352	luncheon
8353	lunchtime
8354	lung
8355	lunge
8356	luxurious
8357	luxury
8358	Lynn
8359	lyric
8360	lyrical
8361	lyrics
8362	M
8363	Mac OS X
8364	Macao
8365	Macau
8366	machine
8367	machinery
8368	Machu Picchu
8369	Macintosh operating system
8370	mad
8371	Madagascar
8372	madam
8373	made
8374	Madison
8375	madness
8376	magazine
8377	magic
8378	magic trick
8379	magical
8380	magically
8381	magician
8382	maglev train
8383	magnesium
8384	magnet
8385	magnetic
8386	magnificent
8387	magnify
8388	magnifying glass
8389	magpie
8390	Maha Kumbh Mela
8391	maid
8392	Maikhao Beach
8393	mail
8394	mail a present
8395	mail carrier
8396	mailbox
8397	mailing list
8398	main
8399	main course
8400	main memory
8401	main unit
8402	mainland
8403	mainly
8404	mainstream
8405	maintain
8406	maintenance
8407	maize
8408	majesty
8409	major
8410	majority
8411	make
8412	make (my) bed
8413	make (one's) contributions to
8414	make ... come true
8415	make ... feel at home
8416	make ... from ...
8417	make ... out of ...
8418	make a basket
8419	make a bet
8420	make a birthday card
8421	make a breakthrough
8422	make a card
8423	make a choice
8424	make a contribution to
8425	make a dash for
8426	make a deal
8427	make a decision
8428	make a difference
8429	make a difference (to sb/sth)
8430	make a fire
8431	make a good impression on ...
8432	make a joke
8433	make a life
8434	make a list
8435	make a little space
8436	make a living
8437	make a lot of progress
8438	make a mark on
8439	make a mess
8440	make a mistake
8441	make a model plane
8442	make a name
8443	make a note of
8444	make a phone call
8445	make a plan
8446	make a plan for sth.
8447	make a point
8448	make a poster
8449	make a promise
8450	make a remark
8451	make a sentence
8452	make a snowman
8453	make a sound
8454	make a video call
8455	make a wish
8456	Make a wish.
8457	make allowance(s) for
8458	make an appointment
8459	make an appointment with someone
8460	make an effort
8461	make an impression on sb.
8462	make certain
8463	make comments
8464	make contact with
8465	make efforts
8466	make ends meet
8467	make faces
8468	make for ...
8469	make friends
8470	make friends with
8471	make from
8472	make fun of
8473	make fun of sb.
8474	make good use of sth.
8475	make great progress
8476	make history
8477	make improvement
8478	make inquiries
8479	make it
8480	make it to
8481	make jokes about
8482	make less fuss about ...
8483	make light of
8484	make mistakes
8485	make models
8486	make money
8487	make New Year's resolutions
8488	make no mistake
8489	make noise
8490	make noises
8491	make notes of
8492	make of sth/sb
8493	make one's acquaintance
8494	make one's appearance
8495	make one's bed
8496	make one's decision
8497	make one's fortune
8498	make one's living
8499	make one's own decision
8500	make one's way
8501	make one's way to
8502	make one's way towards
8503	make out
8504	make peace
8505	make peace (with sb)
8506	make phone calls
8507	make plant
8508	make progress
8509	make room for
8510	make sb's acquaintance
8511	make sense
8512	make snowmen
8513	make soup
8514	make such a fuss
8515	make sure
8516	make the bed
8517	make the best use of
8518	make the effort
8519	make the first move
8520	make the headlines
8521	make the most of
8522	make the soccer team
8523	make up
8524	make up for
8525	make up one's mind
8526	make use of
8527	make way for
8528	makeover
8529	maker
8530	makeup
8531	make-up
8532	making models
8533	mal-
8534	maladjustment
8535	malaria
8536	Malawi
8537	Malaysia
8538	Malaysian
8539	male
8540	male connectors
8541	malfunction
8542	malicious-logic program
8543	mall
8544	mammal
8545	man
8546	manage
8547	manage to do
8548	manage to do sth.
8549	managed fund
8550	management
8551	manager
8552	Manchu
8553	mandarin
8554	Mandy
8555	mane
8556	mango
8557	Manhattan
8558	mankind
8559	man-made
8560	manned
8561	manned spaceship
8562	manner
8563	manners
8564	manor
8565	mansion
8566	manual
8567	manual labour
8568	manufacture
8569	manufacturer
8570	manuscript
8571	many
8572	many a(n)
8573	many kinds of
8574	Maori
8575	map
8576	maple
8577	maple leaves
8578	maple syrup
8579	maple wood
8580	mar
8581	Mar.
8582	marathon
8583	marble
8584	Marc LeBlanc
8585	march
8586	March
8587	March of the Penguins
8588	marcher
8589	Marco Polo
8590	Marcus
8591	Margaret Mitchell
8592	Margot
8593	Maria
8594	Mariana
8595	Marie
8596	marine
8597	mariner
8598	Mario
8599	Marion
8600	mark
8601	Mark
8602	mark out
8603	Mark Twain
8604	marker
8605	market
8606	marketing
8607	marlin
8608	marriage
8609	married
8610	marry
8611	Mars
8612	marshalling
8613	martial
8614	martial art
8615	martial arts
8616	Martian
8617	Martin
8618	Martin Luther King
8619	Martin Luther King, Jr
8620	Marty Fielding
8621	martyr
8622	marvel
8623	marvel at
8624	marvellous
8625	Mary
8626	Maryann Jones
8627	Maryland
8628	Masaccio
8629	mascot
8630	mash
8631	mashed potatoes
8632	mask
8633	mass
8634	mass production
8635	Massachusetts
8636	masses of
8637	massive
8638	master
8639	master musician
8640	masterpiece
8641	master's degree
8642	mat
8643	match
8644	matches
8645	matchless
8646	matchstick
8647	mate
8648	material
8649	material possessions
8650	materialistic
8651	math
8652	mathematical
8653	mathematician
8654	mathematics
8655	maths
8656	Maths
8657	maths book
8658	Matisse
8659	Matt
8660	matter
8661	mature
8662	Mauritius
8663	mausoleum
8664	maximize
8665	maximum
8666	may
8667	May
8668	May Day
8669	May I have ...?
8670	May I help you?
8671	May I speak to ... , please?
8672	May/Can I help you?
8673	maybe
8674	Mayella
8675	mayor
8676	maze
8677	MBps
8678	MC-ing
8679	me
8680	Me neither.
8681	Me too.
8682	Me, too.
8683	meadow
8684	meal
8685	mean
8686	mean to
8687	mean to ...
8688	mean to do ...
8689	meander
8690	meaning
8691	meaningful
8692	meaningless
8693	means
8694	meantime
8695	meanwhile
8696	measure
8697	measurement
8698	meat
8699	meatball
8700	mechanic
8701	mechanical
8702	mechanical mouse
8703	mechanism
8704	medal
8705	medals
8706	media
8707	mediator
8708	medical
8709	medical examination
8710	medical field
8711	medical worker
8712	medicine
8713	medieval
8714	meditation
8715	medium
8716	medium of exchange
8717	meekly
8718	meet
8719	meet one's needs
8720	meet some friends
8721	meet the demand for
8722	meet with
8723	meeting
8724	meeting place
8725	meeting room
8726	megabyte
8727	Mekong
8728	Melbourne
8729	melodie
8730	melody
8731	melon
8732	melt
8733	melted
8734	member
8735	member state
8736	membership
8737	memo
8738	memorable
8739	memorial
8740	memorise
8741	memorization
8742	memorize
8743	memory
8744	memory management
8745	Memory Stick®
8746	men
8747	Men in Black
8748	mend
8749	mental
8750	mentality
8751	mentally
8752	mention
8753	menu
8754	menu-driven interface
8755	meow
8756	mercenary
8757	merchandise
8758	merchandiser
8759	merchant
8760	merciful
8761	Mercury
8762	mercy
8763	merely
8764	Merlin the Wizard
8765	merrily
8766	merry
8767	Merry Christmas
8768	Merry Christmas!
8769	merry-go-round
8770	mess
8771	mess up
8772	message
8773	message board
8774	Messi
8775	messy
8776	met
8777	metal
8778	metaphor
8779	metaphorical
8780	metaphorically
8781	meteorite
8782	meter
8783	methane
8784	method
8785	metre
8786	metro
8787	metropolis
8788	metropolitan
8789	Mexican
8790	Mexico
8791	miaow
8792	mice
8793	Michael
8794	Michelangelo
8795	Mickey Mouse
8796	microcosm
8797	MicrodriveTM
8798	microphone
8799	microprocessor
8800	microscope
8801	microscopic
8802	microwave
8803	mid-
8804	Mid-autumn Festival
8805	Mid-Autumn Festival
8806	middle
8807	middle school
8808	MIDI
8809	MIDI port
8810	Midlands
8811	midnight
8812	Midori
8813	midst
8814	midsummer
8815	mid-term
8816	mid-term exam
8817	midwestern
8818	Midwestern
8819	might
8820	might as well
8821	mighty
8822	migrant
8823	migrate
8824	migration
8825	Mike
8826	mild
8827	mildly
8828	mile
8829	miles
8830	milestone
8831	military
8832	milk
8833	milk a cow
8834	milk shake
8835	milkman
8836	milkshake
8837	milkweed
8838	mill
8839	millennium
8840	miller
8841	Miller
8842	millimetre
8843	million
8844	millionaire
8845	millions of
8846	millipede
8847	Mills
8848	Milu deer
8849	mime
8850	mind
8851	mind reader
8852	mindless
8853	mine
8854	minefield
8855	miner
8856	mineral
8857	mini
8858	miniature
8859	minibus
8860	minimum
8861	mining
8862	mini-skirt
8863	minister
8864	ministry
8865	Minnie
8866	minor
8867	minority
8868	minus
8869	minute
8870	Minute Waltz
8871	miracle
8872	mirror
8873	miscellaneous
8874	miserable
8875	misery
8876	misfortune
8877	misguided
8878	misinterpreted
8879	misleading
8880	misplace
8881	misread
8882	miss
8883	Miss
8884	miss class
8885	miss out on
8886	miss school
8887	missed
8888	misshapen
8889	missile
8890	missing
8891	mission
8892	missionary
8893	Mississippi
8894	Mississippi River
8895	Missouri
8896	misspelled
8897	mist
8898	mistake
8899	mistake ... for
8900	mistake ... for ...
8901	mistaken
8902	mistreat
8903	mistreatment
8904	mistress
8905	mistrust
8906	misty
8907	misunderstand
8908	misunderstanding
8909	mitten
8910	mix
8911	mix ... with ...
8912	mix up
8913	mix with
8914	mixed
8915	mixed grill
8916	mixing
8917	mixture
8918	mm
8919	mob
8920	mobile
8921	mobile phone
8922	mobility
8923	mockingbird
8924	model
8925	model car
8926	model house
8927	model plane
8928	modem
8929	modem card
8930	moderate
8931	moderately
8932	moderation
8933	moderator
8934	modern
8935	modern-day
8936	modernize
8937	modest
8938	modesty
8939	modify
8940	modifying investments
8941	module
8942	Mohandas Gandhi
8943	moist
8944	moisture
8945	molasses
8946	mold
8947	molecular
8948	Molly
8949	molten
8950	mom
8951	moment
8952	momentary
8953	momentous
8954	momma
8955	Mona Lisa
8956	Monday
8957	Monet
8958	monetary
8959	money
8960	Mongolian
8961	Monica
8962	monitor
8963	monitoring investments
8964	monk
8965	monkey
8966	monkey bar
8967	Monkey King
8968	monochrome
8969	monolingual
8970	monologue
8971	monsieur
8972	monster
8973	Montgomery
8974	month
8975	monthly
8976	monument
8977	moo
8978	mood
8979	moody
8980	moon
8981	moon cake
8982	mooncake
8983	moonlight
8984	moor
8985	moose
8986	mop
8987	moral
8988	moral value
8989	morale
8990	morality
8991	more
8992	more ... than ever
8993	more and more
8994	more or less
8995	more than
8996	more than ...
8997	moreover
8998	morning
8999	morning exercises
9000	morning tea
9001	Morse code
9002	mortgage
9003	mortgage broker
9004	Moscow
9005	Moslem
9006	mosque
9007	mosquito
9008	moss
9009	most
9010	Most-Improved Student Award
9011	mostly
9012	motel
9013	moth
9014	mother
9015	mother tongue
9016	motherboard
9017	motherland
9018	Mother's Day
9019	motion
9020	motivate
9021	motivation
9022	motivational
9023	motive
9024	motor
9025	motor neurone disease
9026	motorbike
9027	motorcycle
9028	motorist
9029	motorway
9030	motto
9031	mould
9032	mound
9033	mount
9034	Mount Etna
9035	Mount Kilauea
9036	Mount Kilimanjaro
9037	Mount Taishan
9038	Mount Vesuvius
9039	mountain
9040	mountain climbing
9041	mountaineering
9042	mountainous
9043	mountains of
9044	mountainside
9045	mountaintop
9046	mounting
9047	mourn
9048	mourning
9049	mouse
9050	mouse pad
9051	mouse pointer
9052	moustache
9053	mouth
9054	mouthful
9055	movable
9056	move
9057	move ... away from
9058	move away
9059	move away from
9060	move from ... to ...
9061	move in
9062	move off
9063	move on
9064	move up
9065	moveable
9066	movement
9067	movie
9068	movie review
9069	movie star
9070	movie theater
9071	movie ticket
9072	movie tickets
9073	moving
9074	Moving Pictures Experts Group
9075	mow the lawn
9076	Mozart
9077	MP3
9078	Mr
9079	Mr.
9080	Mrs
9081	Mrs.
9082	Ms
9083	Ms.
9084	much
9085	much less
9086	much more
9087	mud
9088	muddy
9089	muffled
9090	muffler
9091	mug
9092	mule
9093	multicultural
9094	multi-cultural
9095	multiculturalism
9096	multi-ethnic
9097	multilateral
9098	multimedia
9099	multinational
9100	multiple
9101	multiply
9102	multiprocessing
9103	multipurpose operating system
9104	multi-storey
9105	multitasking
9106	multiuser
9107	mum
9108	mummy
9109	munch
9110	Munich
9111	mural
9112	murder
9113	murderer
9114	murmur
9115	muscle
9116	museum
9117	mushroom
9118	mushrooms
9119	music
9120	Music
9121	music class
9122	music room
9123	music video
9124	musical
9125	musical group
9126	musical instrument
9127	Musical Instrument Digital Interface
9128	musical notes
9129	musically speaking
9130	musician
9131	Muslim
9132	must
9133	mustard
9134	mustn't
9135	musty
9136	mute
9137	mutter
9138	mutton
9139	mutual
9140	my
9141	my goodness
9142	My name is ...
9143	my pleasure
9144	myself
9145	mysterious
9146	mysteriously
9147	mystery
9148	mystified
9149	myth
9150	mythological
9151	mythology
9152	mzee
9153	Nagoya
9154	nail
9155	naively
9156	name
9157	name ... after
9158	name after
9159	namely
9160	Nancy
9161	nanosecond
9162	nap
9163	Napier
9164	napkin
9165	narrate
9166	narrative
9167	narrator
9168	narrow
9169	Nashville
9170	nasty
9171	Nathaniel Ward
9172	nation
9173	national
9174	National Day
9175	national flag
9176	National Science Museum
9177	nationalism
9178	nationality
9179	nationwide
9180	native
9181	Native American
9182	Native American Indian
9183	natural
9184	natural disaster
9185	natural selection
9186	naturalist
9187	naturally
9188	nature
9189	nature park
9190	nature show
9191	nature shows
9192	naughty
9193	nautical
9194	nautical mile
9195	navigate
9196	navigation
9197	navigator
9198	navy
9199	Nazi
9200	NBA
9201	NBA All-Star
9202	near
9203	nearby
9204	nearly
9205	nearness
9206	neat
9207	neatly
9208	necessarily
9209	necessary
9210	necessity
9211	neck
9212	neck and neck
9213	necklace
9214	nectar
9215	need
9216	needle
9217	needless to say
9218	needlework
9219	negative
9220	negatively
9221	neglect
9222	negotiate
9223	Negro
9224	neigh
9225	neighbor
9226	neighborhood
9227	neighbour
9228	neighbourhood
9229	neither
9230	neither ... nor ...
9231	Nelly
9232	Nelson Mandela
9233	Nepal
9234	nephew
9235	Neptune
9236	nerve
9237	nervous
9238	nervously
9239	Nessie
9240	nest
9241	net
9242	Netherlands
9243	NetWare
9244	network
9245	network card
9246	network operating system
9247	neutral
9248	Nevada
9249	never
9250	never look back
9251	never mind
9252	nevertheless
9253	new
9254	New South Wales
9255	new year
9256	New Year
9257	New Year's Day
9258	New York
9259	New York City
9260	New Zealand
9261	newborn
9262	newest
9263	new-found
9264	newly
9265	newness
9266	news
9267	news show
9268	news shows
9269	newsflash
9270	newsgroup
9271	newspaper
9272	newspaper stand
9273	newsstand
9274	next
9275	next door
9276	next time
9277	next to
9278	next to last
9279	next week
9280	next year
9281	Niagara
9282	Niagara Falls
9283	nibble
9284	nice
9285	Nice to meet you!
9286	Nice to meet you, too.
9287	Nice to meet you.
9288	nicely
9289	Nick
9290	nickname
9291	Nicolaus Copernicus
9292	nicotine
9293	niece
9294	Nigeria
9295	night
9296	Night Safari
9297	nightfall
9298	nightgown
9299	nightmare
9300	nighttime
9301	Nile
9302	nine
9303	nineteen
9304	nineteenth
9305	ninety
9306	Nintendo
9307	ninth
9308	nitrogen
9309	no
9310	no doubt
9311	No eating or drinking.
9312	no entry
9313	No entry.
9314	no fewer than
9315	no good
9316	no idea
9317	No littering.
9318	no longer
9319	no matter
9320	no matter what ...
9321	no more
9322	No noise, please!
9323	No parking.
9324	No photos!
9325	no problem
9326	No problem.
9327	no smoking
9328	No smoking.
9329	no sooner ... than ...
9330	no swimming
9331	no way
9332	no wonder
9333	No, thank you.
9334	No.
9335	no/not ... at all
9336	Noah
9337	Noah Webster
9338	Nobel
9339	Nobel Peace Prize
9340	Nobel Prize
9341	noble
9342	nobody
9343	nod
9344	noise
9345	noisily
9346	noisy
9347	nomadic
9348	nominate
9349	nomination
9350	nondestructive
9351	none
9352	none of one's business
9353	nonetheless
9354	non-existent
9355	nonimpact printer
9356	non-native
9357	non-profit
9358	nonsense
9359	non-smoker
9360	non-smoking
9361	nonverbal
9362	non-verbal communication
9363	nonviolence
9364	nonvolatile memory
9365	non-working
9366	noodle
9367	noodles
9368	noon
9369	nor
9370	norm
9371	normal
9372	normally
9373	Norman
9374	Norman Bethune
9375	north
9376	North American
9377	North Pole
9378	northeast
9379	north-east
9380	northeastern
9381	northern
9382	Northern Ireland
9383	northwest
9384	north-west
9385	northwestern
9386	Norway
9387	Norwegian
9388	nose
9389	nosebleed
9390	not
9391	not ... any longer
9392	not ... any more
9393	not ... anymore
9394	not ... at all
9395	not ... until ...
9396	not at all
9397	not bad
9398	not believe one's eyes
9399	not enough
9400	not for ... but rather for ...
9401	not for long
9402	not lift/raise a finger (to do sth.)
9403	not only ... but (also)
9404	not only ... but (also) ...
9405	not only ... but also
9406	not only ... but also ...
9407	not really
9408	Not really.
9409	Not so good.
9410	not to mention
9411	notable
9412	note
9413	note pad
9414	note sth. down
9415	notebook
9416	noted
9417	noted for
9418	notepad
9419	notes
9420	nothing
9421	notice
9422	noticeable
9423	notion
9424	Notre Dame Cathedral
9425	Nottingham
9426	noun
9427	nourish
9428	Nov.
9429	novel
9430	novelist
9431	November
9432	now
9433	now and again
9434	now and then
9435	now that
9436	nowadays
9437	nowhere
9438	nuclear
9439	nuclear arms
9440	nuclear energy
9441	nuclear power
9442	nuclear weapon
9443	nucleus
9444	nudge
9445	nugget
9446	nuisance
9447	Nullarbor
9448	numb
9449	number
9450	numerology
9451	numerous
9452	nun
9453	Nunavut
9454	nurse
9455	nurse cap
9456	nursery
9457	nursery rhyme
9458	nursing
9459	nut
9460	nutrient
9461	nutrition
9462	nutritional
9463	nutritionist
9464	nutritious
9465	nutshell
9466	oak
9467	oar
9468	oasis
9469	obese
9470	obesity
9471	obey
9472	object
9473	objection
9474	objective
9475	objectively
9476	objectively speaking
9477	obligation
9478	oblivious
9479	Obon
9480	obscure
9481	observation
9482	observatory
9483	observe
9484	observer
9485	obsess
9486	obsession
9487	obsolete
9488	obstacle
9489	obtain
9490	obvious
9491	obviously
9492	occasion
9493	occasional
9494	occasionally
9495	occupation
9496	occupational
9497	occupy
9498	occur
9499	occur to sb.
9500	ocean
9501	Ocean Park
9502	Oceania
9503	o'clock
9504	OCR software
9505	Oct.
9506	October
9507	odd
9508	odd jobs
9509	ode
9510	odour
9511	odourless
9512	Odysseus
9513	of
9514	of all ages
9515	of all time
9516	of course
9517	Of course.
9518	of one's own
9519	of some kind
9520	of vital importance
9521	off
9522	off the top of one's head
9523	offence
9524	offend
9525	offending
9526	offensive
9527	offer
9528	offer one's seat to sb.
9529	offering
9530	office
9531	office building
9532	office worker
9533	officer
9534	official
9535	official-looking
9536	officially
9537	offload
9538	offshore
9539	often
9540	oh
9541	Oh dear!
9542	oil
9543	oil painting
9544	oilfield
9545	oily
9546	ointment
9547	OK
9548	old
9549	older
9550	oldest
9551	olive
9552	Oliver
9553	Oliver Twist
9554	Olympia
9555	Olympic
9556	Olympic Games
9557	Olympics
9558	omit
9559	on
9560	on (a) vacation
9561	on a farm
9562	on a small scale
9563	on a vacation
9564	on air
9565	on average
9566	on behalf of
9567	on behalf of somebody
9568	on board
9569	on both sides of
9570	on business
9571	on condition that
9572	on contact with
9573	on foot
9574	on guard
9575	on hand
9576	on holiday
9577	on leave
9578	on my way
9579	on one's feet
9580	on one's mind
9581	on one's own
9582	on one's side
9583	on one's way
9584	on one's way to
9585	on one's/the way
9586	on principle
9587	on purpose
9588	on sale
9589	on schedule
9590	on somebody's behalf
9591	on standby
9592	on strike
9593	on the anniversary of
9594	on the contrary
9595	on the edge of
9596	on the eve of the Spring Festival
9597	on the farm
9598	on the front (of ... )
9599	on the hour
9600	on the increase
9601	on the Internet
9602	on the left
9603	on the one hand ... on the other hand ...
9604	on the opposite side of
9605	on the other hand
9606	on the phone
9607	on the right
9608	on the right track
9609	on the run
9610	on the schedule
9611	on the screen
9612	on the side of sb./sth.
9613	on the stage
9614	on the top of
9615	on the way
9616	on the way out
9617	on the way to
9618	on the weekend
9619	on the whole
9620	on time
9621	on top of
9622	on top of ...
9623	on top of the world
9624	on vacation
9625	on weekdays
9626	on weekends
9627	on your right
9628	once
9629	once a week
9630	once again
9631	once in a while
9632	once more
9633	once or twice
9634	once upon a time
9635	one
9636	one (large) bowl of ...
9637	one (tune) after another
9638	One ... and the other ...
9639	one ..., the other ...
9640	one after another
9641	one another
9642	one by one
9643	one day
9644	one hundred
9645	one of
9646	one third
9647	one's (own) flesh and blood
9648	oneself
9649	one-to-one
9650	one-way ticket
9651	ongoing
9652	onion
9653	onions
9654	online
9655	online Help
9656	online trading
9657	only
9658	only if
9659	onset
9660	onto
9661	onwards
9662	ooh
9663	oops
9664	open
9665	open day
9666	open source software
9667	open space
9668	open the floor
9669	open up
9670	Open your book.
9671	open-ended
9672	opening
9673	opening hours
9674	open-minded
9675	opera
9676	opera house
9677	operate
9678	operating system
9679	operating theatre
9680	operation
9681	operational
9682	operator
9683	opinion
9684	opinionated
9685	opportunity
9686	oppose
9687	opposed
9688	opposing
9689	opposite
9690	oppression
9691	optical mouse
9692	optical reader
9693	optical scanner
9694	optimal
9695	optimism
9696	optimistic
9697	option
9698	optional
9699	or
9700	or else
9701	or rather
9702	or so
9703	or something
9704	oral
9705	orange
9706	orange juice
9707	orange-and-white
9708	orangutan
9709	orang-utan
9710	orbit
9711	orchard
9712	orchestra
9713	orchid
9714	order
9715	orderly
9716	ordinary
9717	ordinary-looking
9718	organ
9719	organic
9720	organic product
9721	organically
9722	organisation
9723	organisational
9724	organise
9725	organised
9726	organism
9727	organization
9728	organize
9729	organized
9730	organizer
9731	organizing
9732	oriented
9733	origin
9734	original
9735	originally
9736	originate
9737	Orlando
9738	ornament
9739	ornate
9740	orphan
9741	Orson Welles
9742	OS/2 Warp Client
9743	Osaka
9744	Oscar
9745	ostrich
9746	Oswald
9747	other
9748	other than
9749	others
9750	otherwise
9751	Ottawa
9752	ouch
9753	ought
9754	ought to
9755	our
9756	ours
9757	ourselves
9758	out
9759	out of
9760	out of ...
9761	out of breath
9762	out of context
9763	out of control
9764	out of curiosity
9765	out of date
9766	out of every ten
9767	out of fashion
9768	out of one's head
9769	out of order
9770	out of place
9771	out of print
9772	out of respect
9773	out of sight
9774	out of style
9775	out of the blue
9776	out of the corner of one's eye
9777	out of the question
9778	out of the way
9779	out of work
9780	outbreak
9781	outcome
9782	outdoor
9783	outdoors
9784	outer
9785	outer space
9786	outfit
9787	outgoing
9788	outing
9789	outlast
9790	outlaw
9791	outlet
9792	outline
9793	outlook
9794	outnumber
9795	out-of-date
9796	out-of-print
9797	outpatient
9798	output
9799	output device
9800	outside
9801	outsider
9802	outspoken
9803	outstanding
9804	outward
9805	outwards
9806	outweigh
9807	oval
9808	oven
9809	over
9810	over again
9811	over and over again
9812	over the horizon
9813	over the years
9814	over there
9815	overboard
9816	overcoat
9817	overcome
9818	overcommitted
9819	overdo
9820	overdue
9821	overeat
9822	over-emotional
9823	overfill
9824	overfish
9825	over-fishing
9826	overflow
9827	overhead
9828	overheating
9829	overjoyed
9830	overlapping
9831	overlook
9832	overly
9833	overnight
9834	overpower
9835	overseas
9836	oversight
9837	oversleep
9838	overtake
9839	over-the-counter medicine
9840	overtime
9841	overtone
9842	overturn
9843	overuse
9844	overview
9845	over-wear
9846	overweight
9847	owe
9848	owe ... to
9849	Owen
9850	owl
9851	own
9852	owner
9853	ownership
9854	ox
9855	Oxford
9856	oxide
9857	oxygen
9858	ozone
9859	ozone layer
9860	P
9861	P.E.
9862	p.m.
9863	P.M.
9864	P.S.
9865	pace
9866	pace of life
9867	Pacific
9868	Pacific Ocean
9869	pack
9870	pack (sth) up
9871	pack up
9872	package
9873	package of
9874	packaged software
9875	packaging
9876	packed
9877	packet
9878	pad
9879	paddle
9880	page
9881	pagoda
9882	pail and shovel
9883	pain
9884	pain pill
9885	pained
9886	painful
9887	painfully
9888	painkiller
9889	paint
9890	paint brushes
9891	paint the fence
9892	paint/image editing software
9893	paintbrush
9894	painted
9895	Painted Desert
9896	painter
9897	painting
9898	paints
9899	pair
9900	pair ... with
9901	pajama
9902	pajamas
9903	Pakistan
9904	Pakistani
9905	pal
9906	palace
9907	Palace Museum
9908	pale
9909	palette
9910	palm
9911	palm tree
9912	Pam
9913	pamphlet
9914	pan
9915	pancake
9916	panda
9917	panic
9918	pantomime
9919	pants
9920	papa
9921	Papa Westray
9922	paparazzi
9923	paper
9924	paper clip
9925	paper cutting
9926	paper-cuts
9927	paperwork
9928	Papua New Guinea
9929	parachute
9930	parade
9931	paradox
9932	paragliding
9933	paragraph
9934	paralanguage
9935	parallel
9936	parallel port
9937	Paralympic
9938	Paralympics
9939	paralyze
9940	paramount
9941	parasailing
9942	parcel
9943	pardon
9944	pardon me
9945	parent
9946	parents
9947	Parents' Day
9948	Paris
9949	park
9950	parking
9951	parking lot
9952	parkland
9953	parliament
9954	parlor
9955	parlour
9956	parrot
9957	part
9958	part of
9959	part of speech
9960	part with
9961	partial
9962	partially
9963	participant
9964	participate
9965	particle
9966	particular
9967	particularly
9968	partly
9969	partner
9970	partnership
9971	part-time
9972	part-time position
9973	part-time work
9974	party
9975	party hat
9976	party whistle
9977	pass
9978	pass ... off as ...
9979	pass a test
9980	pass around
9981	pass away
9982	pass by
9983	Pass me the milk, please!
9984	pass on
9985	pass out
9986	pass sb/sth off as sth
9987	pass something on (to somebody)
9988	pass sth. on to sb.
9989	passage
9990	passageway
9991	passbook
9992	passenger
9993	passerby
9994	passer-by
9995	passing
9996	passion
9997	passionate
9998	passive
9999	passport
10000	password
10001	past
10002	pasta
10003	paste
10004	pastime
10005	pasting
10006	pastor
10007	pat
10008	patch
10009	patent
10010	path
10011	pathologist
10012	patience
10013	patient
10014	patiently
10015	Patrick
10016	patriot
10017	patriotism
10018	patrol
10019	patronise
10020	pattern
10021	Paul
10022	Paul Stoker
10023	Paula
10024	pauper
10025	Pausanias
10026	pause
10027	pave
10028	pavement
10029	paw
10030	pay
10031	pay ... a compliment
10032	pay attention
10033	pay attention (to)
10034	pay attention to
10035	pay for
10036	pay no attention to ...
10037	pay off
10038	pay one's respect to ...
10039	pay one's respects
10040	pay phone
10041	pay rise
10042	payment
10043	payoff
10044	PC
10045	PC camera
10046	PC Card
10047	PC video camera
10048	PDA
10049	PE
10050	PE class
10051	pea
10052	peace
10053	peace and quiet
10054	peace pipe
10055	peaceful
10056	peacefully
10057	peacekeeper
10058	peacemaker
10059	peach
10060	peacock
10061	peak
10062	peanut
10063	peanut butter
10064	pear
10065	Pearce
10066	pearl
10067	peas
10068	peasant
10069	peck
10070	peck at
10071	peculiar
10072	pedal
10073	pedestrian
10074	pedicab
10075	peek
10076	peel
10077	peel ... off
10078	peer
10079	peer pressure
10080	peg
10081	pen
10082	pen friend
10083	pen holder
10084	pen pal
10085	penalty
10086	Penang Hill
10087	pencil
10088	pencil box
10089	pencil case
10090	pencil sharpener
10091	pencil-box
10092	pencil-case
10093	pencils
10094	pendant
10095	Penelope
10096	penfriend
10097	penguin
10098	penicillin
10099	penniless
10100	penny
10101	pension
10102	pensioner
10103	people
10104	people of all ages
10105	pepper
10106	peppercorn
10107	peppery
10108	per
10109	per cent
10110	per head
10111	Perce Blackborow
10112	perceive
10113	percent
10114	percent of
10115	percentage
10116	perception
10117	percussion
10118	perfect
10119	perfection
10120	perfectly
10121	perform
10122	perform an operation
10123	performance
10124	performance monitor
10125	performance-enhancing
10126	performer
10127	perfume
10128	perhaps
10129	period
10130	peripheral
10131	perish
10132	permanent
10133	permanent employee
10134	permanent member
10135	permanently
10136	permission
10137	permit
10138	Perseus
10139	perseverance
10140	persevere
10141	Persian
10142	person
10143	personal
10144	personal computer maintenance utility
10145	personal firewall
10146	personal quality
10147	personality
10148	personalized
10149	personally
10150	personnel
10151	personnel department
10152	perspective
10153	persuade
10154	persuasion
10155	persuasive
10156	persuasively
10157	Perth
10158	Peru
10159	pessimistic
10160	pest
10161	pesticide
10162	pet
10163	petal
10164	Peter
10165	Peter the Great
10166	petrol
10167	phantom
10168	phase
10169	PhD
10170	phenomenon
10171	phew
10172	Philadelphia
10173	Philippines
10174	philosopher
10175	philosophic
10176	philosophical
10177	philosophy
10178	philosophy of life
10179	Phoebe
10180	phoenix
10181	phone
10182	phone banking
10183	phone box
10184	phone call
10185	phonetic
10186	phonetics
10187	photo
10188	photo album
10189	photo community
10190	photo editing software
10191	photocopy
10192	photoelectric
10193	photoelectric effect
10194	photograph
10195	photographer
10196	photographic
10197	photography
10198	phrase
10199	physical
10200	physical education
10201	physical well-being
10202	physically
10203	physician
10204	physicist
10205	physics
10206	physiology
10207	pianist
10208	piano
10209	Picasso
10210	pick
10211	pick ... out
10212	pick ... up
10213	pick apples
10214	pick fruit
10215	pick oneself up
10216	pick out
10217	pick sb. up (by ... )
10218	pick up
10219	pick yourself up
10220	Pickering
10221	pickpocket
10222	picnic
10223	picture
10224	pie
10225	pie chart
10226	piece
10227	pier
10228	pierce
10229	pig
10230	pigeon
10231	pile
10232	pile up
10233	piles of
10234	pilgrim
10235	pill
10236	pillar
10237	pillow
10238	pilot
10239	pimento
10240	pimple
10241	pin
10242	pin (on)
10243	pine
10244	pineapple
10245	Ping Pong ball
10246	ping-pong
10247	pink
10248	pint
10249	pioneer
10250	pioneering
10251	pipe
10252	piracy
10253	pirate
10254	pit
10255	pitch
10256	pitcher
10257	pitcher plant
10258	pitiful
10259	pitiless
10260	pitter-patter
10261	pity
10262	pixel
10263	pizza
10264	place
10265	place an order
10266	place of interest
10267	place somebody under arrest
10268	places of interest
10269	plaid
10270	plain
10271	plain clothes
10272	plainly
10273	Plains Indian
10274	plan
10275	plane
10276	planet
10277	planetary
10278	plankton
10279	planned
10280	planning
10281	plant
10282	plant farm
10283	plant trees
10284	plantation
10285	planted
10286	planter
10287	plaster
10288	plastic
10289	plastic age
10290	plastic bag
10291	plate
10292	plateau
10293	plates
10294	platform
10295	play
10296	play (a musical instrument)
10297	play (games)
10298	play a game
10299	play a joke on sb.
10300	play a part
10301	play a part (in)
10302	play a role
10303	play a role in
10304	play a trick on
10305	play a trick on ...
10306	play a trick on sb.
10307	play a very important part
10308	play against
10309	play against ...
10310	play an important part in
10311	play an important role
10312	play an instrument
10313	play around
10314	play basketball
10315	play cards
10316	play catch
10317	play chess
10318	play computer games
10319	play football
10320	play games
10321	play in the snow
10322	play jokes on
10323	play music
10324	play on the swing
10325	play one's part
10326	play outside
10327	play ping-pong
10328	play soccer
10329	play sport
10330	play sports
10331	play tennis
10332	play the drums
10333	play the guitar
10334	play the piano
10335	play the pipa
10336	play the role of
10337	play the violin
10338	play tricks on
10339	play truant
10340	play volleyball
10341	play with
10342	play with fire
10343	play with friends
10344	played
10345	played chess
10346	played computer games
10347	played the piano
10348	player
10349	playful
10350	playground
10351	playing
10352	playing(hopscotch)
10353	playtime
10354	playwright
10355	pleasant
10356	please
10357	Please be quiet!
10358	pleased
10359	Pleased to meet you!
10360	pleasing
10361	pleasurable
10362	pleasure
10363	plentiful
10364	plenty
10365	plenty (of)
10366	plenty of
10367	plot
10368	plough
10369	plug
10370	Plug and Play
10371	plug one's ears
10372	plum
10373	plumes
10374	plunge
10375	plural
10376	plus
10377	Pluto
10378	Plymouth
10379	pm
10380	pneumonia
10381	PNG format
10382	poacher
10383	pocket
10384	pocket money
10385	Pocket PC
10386	Pocket PC 2002
10387	pocket-sized
10388	pod
10389	poem
10390	poet
10391	poetic
10392	poetry
10393	pogo stick jumping
10394	point
10395	point a gun at
10396	point at
10397	point of view
10398	point out
10399	point to
10400	Point to (your chair).
10401	pointer
10402	pointing device
10403	pointing stick
10404	pointless
10405	poison
10406	poisonous
10407	poke
10408	Poland
10409	polar
10410	polar bear
10411	pole
10412	police
10413	police badge
10414	police car
10415	police officer
10416	police station
10417	policeman
10418	policemen
10419	policewoman
10420	policewomen
10421	policy
10422	polish
10423	Polish
10424	polished
10425	polite
10426	politely
10427	political
10428	politician
10429	politics
10430	poll
10431	pollinate
10432	pollinator
10433	pollutant
10434	pollute
10435	polluted
10436	pollution
10437	Polynesia
10438	Polynesian
10439	polyphony
10440	polytechnic
10441	Pompeii
10442	pompom
10443	pond
10444	pony
10445	ponytail
10446	pool
10447	poor
10448	poorly
10449	poorly-dressed
10450	pop
10451	pop into
10452	pop music
10453	pop out
10454	pop out of
10455	popcorn
10456	poplar
10457	poppy
10458	popsicle
10459	popular
10460	popularity
10461	popularize
10462	popularly
10463	populated
10464	population
10465	porcelain
10466	pork
10467	pork chop
10468	porpoise
10469	porridge
10470	port
10471	portable
10472	porter
10473	portfolio
10474	portion
10475	portrait
10476	portrait-sketching
10477	portray
10478	Portugal
10479	position
10480	positive
10481	possess
10482	possession
10483	possessions
10484	possibility
10485	possible
10486	possibly
10487	post
10488	post office
10489	postage
10490	postcard
10491	postcode
10492	poster
10493	post-graduate
10494	post-impressionist
10495	postman
10496	postpone
10497	posture
10498	pot
10499	potassium
10500	potato
10501	potato chip
10502	potato chips
10503	potatoes
10504	potential
10505	potentially
10506	pothole
10507	potted
10508	pound
10509	pound ... into ...
10510	pour
10511	pour ... into
10512	pour into
10513	pour out
10514	poverty
10515	powder
10516	powdered
10517	powder-free
10518	power
10519	power boating
10520	power cut
10521	power line
10522	power pack
10523	power station
10524	power supply
10525	power-free
10526	powerful
10527	powerless
10528	pow-wow
10529	practical
10530	practical joke
10531	practically
10532	practice
10533	Practice makes perfect.
10534	practiced
10535	practise
10536	practise medicine
10537	practitioner
10538	praise
10539	praise ... for ...
10540	pray
10541	pray (for something)
10542	pray for
10543	prayer
10544	PRC
10545	precaution
10546	precede
10547	precious
10548	precipitation
10549	precise
10550	precisely
10551	predator
10552	predict
10553	prediction
10554	preemptive multitasking
10555	prefer
10556	prefer to
10557	preference
10558	prefix
10559	pregnancy
10560	pregnant
10561	prehistoric
10562	prejudice
10563	preliminary
10564	premier
10565	premiere
10566	premium
10567	pre-owned
10568	preparation
10569	prepare
10570	prepare (sb.) for
10571	prepare ... for ...
10572	prepare for
10573	prepare oneself for sth.
10574	prepared
10575	preposition
10576	prescribe
10577	prescription
10578	prescription medicine
10579	presence
10580	present
10581	presentation
10582	presentation graphics software
10583	presentational
10584	present-day
10585	presenter
10586	presently
10587	presents
10588	preservation
10589	preservative
10590	preserve
10591	preserved
10592	preserver
10593	president
10594	presidential
10595	press
10596	pressure
10597	pressure point
10598	presume
10599	pretend
10600	pretension
10601	pretty
10602	pretty good
10603	pretty much
10604	pretzel
10605	prevalence
10606	prevent
10607	prevent ... from
10608	prevent from
10609	prevention
10610	preview
10611	previous
10612	prey
10613	prey on
10614	price
10615	prices
10616	pride
10617	priest
10618	primarily
10619	primary
10620	primary market
10621	primary school
10622	prime
10623	prime function
10624	prime minister
10625	Prime Minister
10626	primitive
10627	prince
10628	princess
10629	Princeton
10630	principal
10631	principality
10632	principle
10633	print
10634	print media
10635	print spooler
10636	printed
10637	printer
10638	printing
10639	printing press
10640	priority
10641	prison
10642	prisoner
10643	prisoner of war
10644	privacy
10645	private
10646	privately
10647	privilege
10648	privileged
10649	prize
10650	prize book
10651	probable
10652	probably
10653	probe
10654	problem
10655	problem-solving
10656	procedure
10657	proceed
10658	proceeds
10659	process
10660	processed food
10661	processing
10662	processor
10663	proclaim
10664	Procrustes
10665	produce
10666	producer
10667	product
10668	production
10669	productive
10670	productivity
10671	pro-environment
10672	profession
10673	professional
10674	professor
10675	profile
10676	profit
10677	profitable
10678	profound
10679	profoundly
10680	program
10681	programme
10682	programmer
10683	programming
10684	progress
10685	progressive
10686	prohibit
10687	project
10688	proliferation
10689	prolific
10690	prolong
10691	prom
10692	prominent
10693	promise
10694	promontory
10695	promote
10696	promoter
10697	prompt
10698	promptly
10699	promptness
10700	prone
10701	pronoun
10702	pronounce
10703	pronunciation
10704	proof
10705	prop
10706	proper
10707	properly
10708	property
10709	prophet
10710	proportion
10711	proposal
10712	propose
10713	proposition
10714	proprietary software
10715	prose
10716	prospect
10717	prospective
10718	prospectus
10719	prosper
10720	prosperity
10721	prosperous
10722	protect
10723	protect ... from
10724	protect ... from (doing)...
10725	protect ... from ...
10726	protect against
10727	protect from
10728	protect sth. against sth.
10729	protected
10730	protection
10731	protective
10732	protein
10733	protest
10734	Protestant
10735	proud
10736	proudly
10737	prove
10738	proverb
10739	provide
10740	provide ... for ...
10741	provide ... with
10742	provide ... with ...
10743	provide for
10744	provide sb. with sth.
10745	provided
10746	provided that
10747	province
10748	Prussia
10749	Prussian
10750	PS
10751	psychological
10752	psychologically
10753	psychologist
10754	psychology
10755	psychometric
10756	pub
10757	puberty
10758	public
10759	public library
10760	public relations
10761	public school
10762	publication
10763	public-domain software
10764	publicity
10765	publicize
10766	publicly
10767	publish
10768	published
10769	publisher
10770	publishing
10771	publishing house
10772	pudding
10773	puddle
10774	puff
10775	pull
10776	pull ... down
10777	pull ... out
10778	pull down
10779	pull faces
10780	pull from under ...
10781	pull into
10782	pull off
10783	pull one's leg
10784	pull oneself up
10785	pull out
10786	pull out ... from
10787	pull out of
10788	pull over
10789	pull sb. off ...
10790	pull sb./sth. out of sth.
10791	pull through
10792	pull together
10793	pull up
10794	pullback
10795	pulled
10796	pull-up
10797	pulp
10798	pulse
10799	Puma Ranch
10800	pump
10801	pumpkin
10802	pun
10803	punch
10804	punchline
10805	punctual
10806	punctuation
10807	punish
10808	punishment
10809	Puno
10810	pupil
10811	puppet
10812	puppet (show)
10813	puppeteer
10814	puppy
10815	purchase
10816	pure
10817	purely
10818	purity
10819	purple
10820	purpose
10821	purse
10822	pursue
10823	pursuit
10824	push
10825	push ... up
10826	push a product
10827	push ahead with
10828	push down
10829	push for something
10830	push in
10831	push sb. aside
10832	push up
10833	pushed
10834	pushing up daisies
10835	push-up
10836	put
10837	put ... in order
10838	put ... into ...
10839	put ... into practice
10840	put ... into prison
10841	put ... into words
10842	put ... on
10843	put ... on its side
10844	put a price on
10845	put a spell on
10846	put across
10847	put an end to
10848	put away
10849	put away(your books)
10850	put down
10851	put emphasis on
10852	put forward
10853	put in
10854	put into effect
10855	put off
10856	put off an appointment
10857	put on
10858	put on weight
10859	Put on your (hat).
10860	put on(your jacket)
10861	put one's arms around sb.
10862	put one's finger on
10863	put one's foot in one's mouth
10864	put one's hands on
10865	put one's heart into
10866	put oneself/sb. down
10867	put out
10868	put out fires
10869	put pressure on somebody (to do something)
10870	put pressure to
10871	put sb. down
10872	put something away
10873	put something into practice
10874	put sth. aside
10875	put sth. to good use
10876	Put the (shirt) away.
10877	put the blame on
10878	put through
10879	put together
10880	put up
10881	put up with
10882	put value on
10883	puzzle
10884	puzzled
10885	puzzling
10886	Pygmalion
10887	pyjama
10888	pyjamas
10889	pyramid
10890	Qingming Festival
10891	Qomolangma
10892	quack
10893	quadrant
10894	quagga
10895	quaint
10896	quake
10897	Quaker
10898	qualification
10899	qualified
10900	quality
10901	quality control
10902	quantities of
10903	quantity
10904	quarrel
10905	quarter
10906	quartet
10907	queen
10908	Queen
10909	Queen's Park
10910	queer
10911	quest
10912	question
10913	question mark
10914	questionable
10915	questionnaire
10916	queue
10917	queue up
10918	queue with sb
10919	quick
10920	quick as a flash
10921	quickly
10922	quiet
10923	quietly
10924	quilt
10925	quit
10926	quit smoking
10927	quite
10928	quite a few
10929	quite a lot
10930	quite a lot (of ... )
10931	quite a lot (of ...)
10932	quite a lot of
10933	quiz
10934	quotation
10935	quote
10936	rabbit
10937	rabies
10938	raccoon
10939	race
10940	racer
10941	racial
10942	racially
10943	racing
10944	racing car
10945	racism
10946	rack
10947	radiation
10948	radio
10949	radio station
10950	radioactive
10951	radioactivity
10952	radium
10953	Rafflesia arnoldii
10954	raft
10955	rag
10956	rage
10957	raid
10958	rail
10959	railway
10960	railway station
10961	raiment
10962	rain
10963	rain forest
10964	rainbow
10965	raincoat
10966	rainfall
10967	rainforest
10968	rainstorm
10969	rainwater
10970	rainy
10971	raise
10972	raise awareness of
10973	raise money
10974	raise one's eyebrows
10975	raise one's spirits
10976	raise one's spirits up to the ceiling
10977	Raise your hand.
10978	raised
10979	raising
10980	rake
10981	RAM
10982	ran
10983	ranch
10984	random
10985	random access memory
10986	rang
10987	range
10988	range from ... to ...
10989	rank
10990	rap
10991	rape
10992	rapid
10993	rapidly
10994	rapids
10995	rapper
10996	rapture
10997	rare
10998	rarely
10999	rascal
11000	rat
11001	rate
11002	rather
11003	rather than
11004	rather than ...
11005	ratify
11006	ratio
11007	rational
11008	rattle
11009	raw
11010	raw material
11011	ray
11012	razor
11013	reach
11014	reach a length of ... in all
11015	reach an agreement
11016	reach out
11017	reach out one's hand
11018	react
11019	reaction
11020	read
11021	read a newspaper
11022	read a story
11023	read books
11024	read head
11025	read out
11026	read sth. through
11027	readable
11028	reader
11029	readily
11030	reading
11031	reading a book
11032	reading room
11033	read-only memory
11034	ready
11035	ready to do sth.
11036	real
11037	real time
11038	realise
11039	realism
11040	realist
11041	realistic
11042	realistically
11043	reality
11044	realization
11045	realize
11046	real-life
11047	really
11048	Really?
11049	realm
11050	reap
11051	reappear
11052	rearrange
11053	reason
11054	reasonable
11055	reasonably
11056	reassurance
11057	reassure
11058	rebate
11059	rebel
11060	rebellion
11061	rebuild
11062	recall
11063	receipt
11064	receive
11065	receiver
11066	recent
11067	recently
11068	reception
11069	receptionist
11070	recipe
11071	recipient
11072	recite
11073	reckon
11074	reckoning
11075	recognisable
11076	recognise
11077	recognise ... as ...
11078	recognition
11079	recognize
11080	recollect
11081	recollection
11082	recommend
11083	recommendation
11084	reconsider
11085	reconstruct
11086	record
11087	record book
11088	record player
11089	recorded
11090	recorder
11091	record-holder
11092	recording
11093	recount
11094	recover
11095	recovery
11096	recreation
11097	rectangle
11098	rectangular
11099	rectify
11100	recycle
11101	recycled
11102	recycling
11103	red
11104	red date
11105	red packet
11106	red-crowned crane
11107	reddish
11108	redesign
11109	rediscover
11110	reduce
11111	reduction
11112	redwood
11113	reef
11114	refer
11115	refer (to)
11116	refer to
11117	refer to ... as ...
11118	referee
11119	reference
11120	reference software
11121	refill
11122	refined
11123	reflect
11124	reflection
11125	reflector
11126	reform
11127	reform and opening-up
11128	reformer
11129	refresh
11130	refreshing
11131	refreshments
11132	refrigerator
11133	refugee
11134	refund
11135	refuse
11136	refute
11137	regain
11138	Regan
11139	regard
11140	regard ... as
11141	regard as
11142	regarding
11143	regardless
11144	regardless of
11145	reggae
11146	region
11147	regional
11148	register
11149	registers
11150	registration
11151	registration form
11152	registry
11153	registry office
11154	regret
11155	regret doing ...
11156	regular
11157	regularly
11158	regulate
11159	regulation
11160	regulatory
11161	rehearsal
11162	rehearse
11163	reheat
11164	reindeer
11165	reinforce
11166	reiterate
11167	reject
11168	rejected
11169	rejoice
11170	relate
11171	relate to
11172	related
11173	related to
11174	relation
11175	relationship
11176	relative
11177	relatively
11178	relatives
11179	relativity
11180	relax
11181	relaxation
11182	relaxed
11183	relaxing
11184	relay
11185	relay race
11186	release
11187	relevant
11188	reliability
11189	reliable
11190	relic
11191	relief
11192	relieve
11193	relieved
11194	religion
11195	religious
11196	relive
11197	reluctant
11198	reluctantly
11199	rely
11200	rely much on
11201	rely on
11202	remain
11203	remain confused about sth.
11204	remain in use
11205	remaining
11206	remains
11207	remark
11208	remarkable
11209	remarkably
11210	remarried
11211	remarry
11212	remedy
11213	remember
11214	remembrance
11215	remind
11216	remind ... of
11217	remind ... of ...
11218	remind sb. about sth.
11219	remind sb. of ...
11220	remind sb. of sth.
11221	remind somebody of
11222	remote
11223	remote control
11224	removal
11225	remove
11226	renaissance
11227	renew
11228	renewable
11229	renowned
11230	rent
11231	rental
11232	repair
11233	repairman
11234	repay
11235	repayment
11236	repeal
11237	repeat
11238	repeated
11239	repeatedly
11240	repentance
11241	repertoire
11242	repetition
11243	replace
11244	replace ... with ...
11245	replacement
11246	reply
11247	report
11248	report card
11249	reporter
11250	represent
11251	representation
11252	representative
11253	reproach
11254	reproduce
11255	reproduction
11256	reptile
11257	republic
11258	reputation
11259	request
11260	require
11261	requirement
11262	rescue
11263	research
11264	researcher
11265	resemblance
11266	resemble
11267	resent
11268	resentfully
11269	reservation
11270	reserve
11271	reservoir
11272	residence
11273	resident
11274	resign
11275	resist
11276	resistance
11277	resistant
11278	resolution
11279	resolve
11280	resort
11281	resource
11282	resourcefulness
11283	resources
11284	respect
11285	respectable
11286	respected
11287	respectful
11288	respective
11289	respond
11290	respond to
11291	response
11292	responsibility
11293	responsible
11294	responsible financial management
11295	rest
11296	restate
11297	restaurant
11298	restless
11299	restore
11300	restrain
11301	restrict
11302	restriction
11303	restroom
11304	result
11305	result in
11306	resulting
11307	retail
11308	retail store
11309	retailer
11310	retain
11311	retell
11312	retire
11313	retired
11314	retirement
11315	retract
11316	retrain
11317	retreat
11318	retreat into
11319	return
11320	returned
11321	reunion
11322	reunite
11323	reusable
11324	reuse
11325	reveal
11326	revelation
11327	revenge
11328	revenue
11329	reverse
11330	review
11331	reviewer
11332	revise
11333	revision
11334	revive
11335	revolting
11336	revolution
11337	revolutionary
11338	revolutionise
11339	revolutionize
11340	revolve
11341	reward
11342	rewarding
11343	rewind
11344	rewrite
11345	Rex
11346	rhino
11347	rhinoceros
11348	rhyme
11349	rhythm
11350	rhythm and blues
11351	rhythmic
11352	rib
11353	ribbon
11354	ribbon dance
11355	rice
11356	rice cake
11357	rice cooker
11358	rice dumpling
11359	rich
11360	rich in
11361	Rick
11362	rickets
11363	rid
11364	rid ... of
11365	ridden
11366	riddle
11367	ride
11368	ride a bike
11369	ride a horse
11370	ride the waves
11371	rider
11372	ridge
11373	ridicule
11374	ridiculous
11375	riding
11376	riding a bike
11377	rifle
11378	right
11379	right away
11380	right now
11381	rightful
11382	rightfully
11383	rightly
11384	rights
11385	rigid
11386	rim
11387	ring
11388	ring back
11389	ring off
11390	ring out
11391	ring true
11392	ring up
11393	rinse
11394	riot
11395	rip
11396	rip off
11397	ripe
11398	ripen
11399	ripple
11400	rise
11401	rise to one's feet
11402	rise up
11403	rise up against
11404	rise up into
11405	risk
11406	risk-free
11407	risky
11408	rival
11409	rivalry
11410	river
11411	River Avon
11412	River Severn
11413	River Thames
11414	riverbank
11415	Riverside High School
11416	road
11417	roadwork
11418	roam
11419	roar
11420	roar with laughter
11421	roast
11422	roast turkey
11423	rob
11424	rob ... of
11425	rob of
11426	Robben Island
11427	robber
11428	robbery
11429	robe
11430	Robert
11431	robin
11432	Robin
11433	Robinson Crusoe
11434	robot
11435	robotic
11436	rock
11437	rock and roll
11438	rock climbing
11439	rock 'n' roll
11440	rockabilly
11441	rocket
11442	rocket-powered
11443	rocking chair
11444	rock'n'roll
11445	rocks
11446	rocky
11447	Rocky Mountains
11448	rod
11449	rode
11450	Roderick
11451	role
11452	role model
11453	role-play
11454	roll
11455	roll up
11456	roller
11457	roller coaster
11458	roller skate
11459	roller skating
11460	rolling
11461	Roman
11462	Roman nose
11463	romance
11464	romantic
11465	romanticise
11466	Romany
11467	Rome
11468	Ronaldo
11469	roof
11470	roofline
11471	rooftop
11472	Rookie of the Month
11473	room
11474	room-mate
11475	rooster
11476	root
11477	root for ...
11478	rooted
11479	roots
11480	rope
11481	rope off
11482	ropeway
11483	Rosalyn
11484	rose
11485	rosebud
11486	rostrum
11487	rosy
11488	rot
11489	rotate
11490	rotating
11491	rotation
11492	rotten
11493	Rotura
11494	rough
11495	rough it
11496	roughly
11497	round
11498	round off
11499	round trip (ticket)
11500	roundabout
11501	round-up
11502	route
11503	routine
11504	Rover
11505	row
11506	row a boat
11507	rowed a boat
11508	rowing machine
11509	Roy
11510	royal
11511	royalty
11512	RSVP
11513	rub
11514	rubber
11515	rubbish
11516	rubbish bin
11517	rubble
11518	Ruby
11519	rude
11520	Rudyard Kipling
11521	rug
11522	rugby
11523	Rugby
11524	ruin
11525	rule
11526	rule breaker
11527	ruler
11528	ruling
11529	rum
11530	rumor
11531	run
11532	run a business
11533	run a race
11534	run across
11535	run after
11536	run an errand for
11537	run away
11538	run away from
11539	run down the stairs
11540	run for
11541	run free
11542	run into
11543	run out
11544	run out (of)
11545	run out of
11546	run over
11547	run to one's aid
11548	run up
11549	runaway
11550	runner
11551	running
11552	running shoe
11553	running water
11554	runny
11555	rural
11556	rush
11557	rush down
11558	rush forward
11559	rush hour
11560	rush into
11561	rush out
11562	rush sb. to ...
11563	rush through
11564	Russia
11565	Russian
11566	rust
11567	rusty
11568	RV
11569	S
11570	sack
11571	sacred
11572	sacrifice
11573	sad
11574	sad clown
11575	saddening
11576	saddle
11577	sadhu
11578	sadly
11579	sadness
11580	safari
11581	safe
11582	safe and sound
11583	safe from ...
11584	safely
11585	safety
11586	safety belt
11587	safety first
11588	safety rule
11589	Sahara Desert
11590	said
11591	sail
11592	sailboat
11593	sailing
11594	sailing boat
11595	sailor
11596	saint
11597	Saint Augustine
11598	sake
11599	salaam
11600	salad
11601	salary
11602	sale
11603	sales
11604	sales assistant
11605	sales department
11606	sales manager
11607	sales trainer
11608	salesgirl
11609	salesman
11610	salesperson
11611	saleswoman
11612	salicylic acid
11613	saliva
11614	Sally
11615	salmon
11616	salt
11617	salty
11618	salutation
11619	salute
11620	Sam
11621	same
11622	same ... as ...
11623	samosa
11624	sample
11625	Samuel
11626	Samuel Johnson
11627	Samuel Langhorne Clemens
11628	San Diego
11629	San Francisco
11630	sanction
11631	sand
11632	sand castle
11633	sandal
11634	sandals
11635	sandbox
11636	Sanders
11637	Sandra
11638	sandstorm
11639	sandwich
11640	sandy
11641	Sandy
11642	Sandy Beach
11643	sane
11644	sang
11645	sanitary
11646	sanitation
11647	sans serif font
11648	Santa
11649	Santa Claus
11650	Sara
11651	Sarah
11652	sarcastic
11653	sari
11654	SARS
11655	sat
11656	satchel
11657	satellite
11658	satellite dish
11659	satire
11660	satisfaction
11661	satisfactorily
11662	satisfactory
11663	satisfied
11664	satisfy
11665	satisfying
11666	Sato
11667	Saturday
11668	Saturn
11669	sauce
11670	saucer
11671	sausage
11672	savage
11673	savagely
11674	save
11675	save ... from
11676	save time
11677	saving
11678	savings
11679	savings account
11680	saw
11681	saw flowers
11682	Saxon
11683	saxophone
11684	say
11685	say cheese
11686	say goodbye to
11687	say hello to
11688	say to oneself
11689	saying
11690	saying “Hello”
11691	sb. can't wait
11692	scald
11693	scale
11694	scan
11695	scanner
11696	scar
11697	scarce
11698	scarcely
11699	scare
11700	scarecrow
11701	scared
11702	scarf
11703	scary
11704	scatter
11705	scavenger
11706	scene
11707	scenery
11708	scenic
11709	scent
11710	sceptical
11711	schedule
11712	scheme
11713	scholar
11714	scholarship
11715	school
11716	school bus
11717	school gate
11718	school play
11719	school uniform
11720	schoolbag
11721	schoolbook
11722	schoolboy
11723	schoolchildren
11724	schoolgirl
11725	schooling
11726	school-leaver
11727	schoolmaster
11728	schoolmate
11729	schoolwork
11730	schoolyard
11731	science
11732	Science
11733	science fiction
11734	science field trip
11735	science museum
11736	scientific
11737	scientific circle
11738	scientific method
11739	scientist
11740	sci-fi
11741	scissors
11742	scold
11743	scoop
11744	scooter
11745	score
11746	score a goal
11747	scorer
11748	scorpion
11749	Scot
11750	Scotland
11751	Scott
11752	Scottish
11753	Scout
11754	scramble
11755	scrapbook
11756	scrape
11757	scraper
11758	scratch
11759	scratch the surface
11760	scrawl
11761	scrawny
11762	scream
11763	screen
11764	screenwriter
11765	script
11766	scriptwriter
11767	Scrooge
11768	SCSI
11769	SCSI port
11770	sculptor
11771	sculpture
11772	scurvy
11773	sea
11774	sea level
11775	Sea World
11776	sea-bed
11777	seafood
11778	seagull
11779	seal
11780	seaman
11781	seamstress
11782	seaport
11783	search
11784	search engine
11785	search for
11786	search for sb./sth.
11787	search text
11788	Sears Tower
11789	seashell
11790	seasick
11791	seasickness
11792	seaside
11793	sea-slug
11794	season
11795	seasonal
11796	seat
11797	seat belt
11798	Seattle
11799	seaweed
11800	sec.
11801	second
11802	second floor
11803	second to none
11804	secondary
11805	secondary market
11806	secondary school
11807	secondary storage
11808	secondhand
11809	second-hand
11810	second-hand smoke
11811	secondly
11812	secret
11813	secretarial
11814	secretariat
11815	secretary
11816	secretive
11817	section
11818	sector
11819	secure
11820	Secure Digital
11821	security
11822	see
11823	see ... off
11824	see a doctor
11825	see a film
11826	see a movie
11827	see about
11828	see films
11829	see red
11830	see the dentist
11831	see the doctor
11832	see the light (of day)
11833	see the world
11834	see through
11835	see you
11836	See you later.
11837	see you tomorrow
11838	See you tomorrow.
11839	See you!
11840	See you.
11841	seed
11842	seedless
11843	seedling
11844	seek
11845	seek one's fortune
11846	seek out
11847	seek to do sth.
11848	seem
11849	seem like
11850	seemingly
11851	seen
11852	seesaw
11853	see-saw
11854	segregation
11855	seize
11856	seize ... by the collar
11857	seize on
11858	seldom
11859	select
11860	selection
11861	self
11862	self-assessment
11863	self-confident
11864	self-discipline
11865	self-disciplined
11866	self-educated
11867	self-employed
11868	self-evident
11869	self-improvement
11870	selfish
11871	selfless
11872	selflessly
11873	self-motivated
11874	self-reflection
11875	sell
11876	sell out
11877	sell out of
11878	sell somebody out
11879	seller
11880	selling
11881	semicircle
11882	semi-circle
11883	semi-final
11884	seminar
11885	senator
11886	send
11887	send ... to prison
11888	send a short message
11889	send an email
11890	send for
11891	send out
11892	senior
11893	senior high
11894	senior high (school)
11895	sensational
11896	sense
11897	sense of achievement
11898	sense of humour
11899	sense of satisfaction
11900	sense of smell
11901	senseless
11902	sensible
11903	sensibly
11904	sensitive
11905	sensitivity
11906	sensory
11907	sent
11908	sentence
11909	sentence sb. to death
11910	sentence somebody to death
11911	sentimental
11912	sentry
11913	Seoul
11914	separate
11915	separate from
11916	separately
11917	separateness
11918	separation
11919	Sept.
11920	September
11921	sequence
11922	Serena
11923	serial port
11924	series
11925	serif font
11926	serious
11927	seriously
11928	serpent
11929	servant
11930	serve
11931	serve (as something)
11932	serve ... with ...
11933	serve as
11934	serve food
11935	serve somebody right
11936	serve sth. to sb.
11937	server
11938	service
11939	service a loan
11940	serving
11941	session
11942	set
11943	set (of something)
11944	set ... free
11945	set a new world record
11946	set about
11947	set aside
11948	set down
11949	set fire to
11950	set fire to ...
11951	set foot on
11952	set free
11953	set in motion
11954	set loose
11955	set off
11956	set off firecrackers
11957	set one's goal for life
11958	set one's standard
11959	set out
11960	set out (to do)
11961	set out to
11962	set sail
11963	set the mountain on fire
11964	set the pace
11965	set the table
11966	set up
11967	set up a time
11968	set(a play, novel, etc.) in
11969	setback
11970	setting
11971	settle
11972	settle down
11973	settle in
11974	settlement
11975	settler
11976	set-up
11977	seven
11978	seventeen
11979	seventeenth
11980	seventh
11981	seventy
11982	several
11983	severe
11984	severely
11985	sew
11986	sewage
11987	sewed
11988	sewing
11989	sewing machine
11990	sex
11991	sextant
11992	sexual
11993	sh
11994	shabby
11995	shade
11996	shades of
11997	shadow
11998	shadowy
11999	shaft
12000	shake
12001	shake hands
12002	shake one's head
12003	shake out
12004	shake sb's hand
12005	Shakespeare
12006	shaking
12007	shaky
12008	shall
12009	Shall we ...?
12010	shallow
12011	shallowness
12012	sham
12013	shame
12014	shameful
12015	shampoo
12016	Shanghai Museum
12017	shape
12018	share
12019	share ... with ...
12020	share feelings and ideas with
12021	share in
12022	share sth with sb
12023	share sth. with sb.
12024	shared
12025	shareware
12026	shark
12027	sharp
12028	sharpen
12029	sharpener
12030	sharply
12031	shattered
12032	shave
12033	shaver
12034	shawl
12035	she
12036	shearer
12037	shed
12038	shed a tear
12039	sheep
12040	sheepdog
12041	sheer
12042	sheet
12043	shelf
12044	shell
12045	shellfish
12046	shelter
12047	shepherd
12048	sheriff
12049	Sherlock Holmes
12050	Sherwood Forest
12051	she's
12052	Shetland Islands
12053	shh
12054	shield
12055	shift
12056	shift ... with ...
12057	shift for oneself
12058	shift out
12059	shilling
12060	shine
12061	shine on
12062	shiny
12063	ship
12064	Shipley
12065	shipment
12066	shipping
12067	shipyard
12068	Shirley Temple
12069	shirt
12070	shirt pocket
12071	shiver
12072	shock
12073	shocked
12074	shocking
12075	shoe
12076	shoelace
12077	shoes
12078	shoot
12079	shoot out
12080	shoot up
12081	shop
12082	shop assistant
12083	shop for clothes
12084	shopkeeper
12085	shoplifting
12086	shopper
12087	shopping
12088	shopping bag
12089	shopping cart
12090	shopping centre
12091	shopping list
12092	shopping mall
12093	shore
12094	short
12095	short cut
12096	short race
12097	shortage
12098	shortcoming
12099	shortcut
12100	shorten
12101	shorter
12102	shortest
12103	shortly
12104	shorts
12105	short-term
12106	shot
12107	shot-put
12108	should
12109	shoulder
12110	shouldn't
12111	shout
12112	shout at ...
12113	shout at sb.
12114	shout to ...
12115	shove
12116	shovel
12117	show
12118	show ... around
12119	show ... in
12120	Show me (your book).
12121	show off
12122	show sb around
12123	show sb. around
12124	show signs of
12125	show somebody around
12126	show somebody up
12127	show up
12128	showcase
12129	shower
12130	shrewd
12131	shrimp
12132	shrink
12133	shrink from (doing) something
12134	shrug
12135	shudder
12136	shun
12137	shut
12138	shut ... up
12139	shut down
12140	shut off
12141	shut sb./sth. out
12142	shut up
12143	shut up somebody
12144	shutter
12145	shuttle
12146	shy
12147	shyly
12148	shyness
12149	Sicily
12150	sick
12151	sickly
12152	sickness
12153	side
12154	side by side
12155	side effect
12156	side road
12157	sideboard
12158	sideroad
12159	sidewalk
12160	sideways
12161	sigh
12162	sight
12163	sighting
12164	sights
12165	sightseeing
12166	sign
12167	sign language
12168	sign of ...
12169	sign the treaty
12170	sign up
12171	signal
12172	signatory
12173	signature
12174	significance
12175	significant
12176	signify
12177	sign-off
12178	signpost
12179	silence
12180	silent
12181	silent film
12182	silk
12183	Silk Road
12184	silk worm
12185	silkworm
12186	silly
12187	silver
12188	silversmith
12189	similar
12190	similar to
12191	similarity
12192	similarly
12193	simile
12194	simple
12195	simplicity
12196	simplify
12197	simply
12198	sin
12199	since
12200	since then
12201	sincere
12202	sincerely
12203	sinew
12204	sing
12205	sing English songs
12206	sing of ...
12207	sing songs
12208	Singapore
12209	singer
12210	singing
12211	single
12212	single user/multitasking
12213	single user/single tasking
12214	singledom
12215	singular
12216	singular pronoun
12217	Sinis
12218	sink
12219	sinkable
12220	sip
12221	sir
12222	Sir Ernest Shackleton
12223	sister
12224	sit
12225	sit around
12226	sit back
12227	sit down
12228	sit down to ...
12229	Sit down.
12230	sit up
12231	Sit.
12232	sitcom
12233	site
12234	sitting room
12235	situate
12236	situated
12237	situation
12238	sit-up
12239	six
12240	sixteen
12241	sixteenth
12242	sixth
12243	sixty
12244	size
12245	size up
12246	skate
12247	skateboard
12248	skateboarding
12249	skater
12250	skating
12251	skating rink
12252	skeptical
12253	sketch
12254	ski
12255	skiing
12256	ski-jump
12257	skilful
12258	skill
12259	skilled
12260	skillful
12261	skim
12262	skin
12263	skinny
12264	skip
12265	skipping rope
12266	skirt
12267	skis
12268	ski-wear
12269	skull
12270	skunk
12271	sky
12272	skyline
12273	skyscraper
12274	slack
12275	slacks
12276	Slade
12277	slam
12278	slam dunk
12279	slang
12280	slap
12281	slap sb. in the face
12282	slave
12283	slavery
12284	sled
12285	sledge
12286	sleep
12287	sleep in
12288	sleep rough
12289	sleeper
12290	sleeping
12291	sleeping bag
12292	Sleeping Beauty
12293	sleepy
12294	sleeve
12295	sleigh
12296	slept
12297	slice
12298	sliced pork
12299	slid
12300	slide
12301	slide away
12302	slide into
12303	slide show
12304	slide sorter view
12305	sliding
12306	slight
12307	slightly
12308	slim
12309	sling
12310	sling across one's shoulder
12311	sling-shots
12312	slip
12313	slip through one's fingers
12314	slipper
12315	slippery
12316	slogan
12317	slope
12318	slot
12319	sloth
12320	Slovenia
12321	slow
12322	slow down
12323	slowest
12324	slowly
12325	slow-witted
12326	slum
12327	slurp
12328	sly
12329	small
12330	small computer system interface
12331	small talk
12332	smaller
12333	smallest
12334	smart
12335	Smart Media
12336	smarter
12337	smartly
12338	smartphone
12339	smash
12340	smell
12341	smell out
12342	smelly
12343	smile
12344	smile at
12345	smiled
12346	smiling
12347	smith
12348	Smith
12349	smock
12350	smog
12351	smoke
12352	smoked
12353	smoker
12354	smoking
12355	smolder
12356	smooth
12357	smoothly
12358	smoothness
12359	SMS
12360	smudge
12361	smuggle
12362	snack
12363	snack bar
12364	snail
12365	snake
12366	snap
12367	snapshot
12368	snatch
12369	sneaker
12370	sneakers
12371	sneeze
12372	sniff
12373	snore
12374	snorkel
12375	snorkelling
12376	snow
12377	snowball
12378	snowboarding
12379	snow-capped
12380	snowflake
12381	snowman
12382	snowrafting
12383	snowstorm
12384	snowy
12385	so
12386	so ... that
12387	so ... that ...
12388	so as to
12389	so as to (do sth)
12390	so far
12391	so long
12392	so long as
12393	so many
12394	so much
12395	so much for sth
12396	so that
12397	so to speak
12398	So what?
12399	soak
12400	soap
12401	soap drama
12402	soap opera
12403	soar
12404	sob
12405	so-called
12406	soccer
12407	soccer ball
12408	social
12409	social media
12410	social rules
12411	social studies
12412	Social Studies
12413	social welfare programs
12414	social worker
12415	socialise
12416	socialism
12417	socialist
12418	socialize
12419	societal
12420	society
12421	sock
12422	socket
12423	socks
12424	soda
12425	sodium
12426	sofa
12427	soft
12428	soft copy
12429	soft drink
12430	soft toy
12431	softball
12432	soften
12433	softly
12434	software
12435	soil
12436	solar
12437	solar eclipse
12438	solar energy
12439	solar system
12440	soldier
12441	sole
12442	solemn
12443	solemnly
12444	solicitor
12445	solid
12446	solid-colored
12447	solo
12448	soloist
12449	solute
12450	solution
12451	solve
12452	solve the problem
12453	solving
12454	somatic
12455	some
12456	some day
12457	some time
12458	somebody
12459	someday
12460	somehow
12461	someone
12462	somersaulting
12463	something
12464	something of
12465	sometime
12466	sometimes
12467	somewhat
12468	somewhere
12469	son
12470	sonar
12471	sonata
12472	song
12473	songbird
12474	sonnet
12475	soon
12476	soon after
12477	Sophie
12478	sophisticated
12479	sophomore
12480	sore
12481	sore throat
12482	sorghum
12483	sorrow
12484	sorrowful
12485	sorry
12486	sort
12487	sort of
12488	sort out
12489	SOS
12490	so-so
12491	soul
12492	soul music
12493	sound
12494	sound card
12495	sound like
12496	soundly
12497	soundproof
12498	soundtrack
12499	soup
12500	sour
12501	source
12502	source document
12503	south
12504	South Africa
12505	South African
12506	South American
12507	South China tiger
12508	South China Tiger
12509	South Korea
12510	South Pole
12511	southeast
12512	south-east
12513	Southeast Asia
12514	southeastern
12515	south-eastern
12516	southern
12517	Southern
12518	Southerner
12519	Southerton
12520	southwest
12521	south-west
12522	southwestern
12523	souvenir
12524	sow
12525	soy
12526	soya
12527	soya milk
12528	soybean
12529	space
12530	space capsule
12531	space flight
12532	space program
12533	space shuttle
12534	space station
12535	space suit
12536	space travel
12537	spacecraft
12538	spaceman
12539	spaceport
12540	spaceship
12541	spacesuit
12542	spacewalk
12543	spade
12544	spaghetti
12545	Spain
12546	span
12547	Spanish
12548	spank
12549	spare
12550	spare somebody from
12551	spare time
12552	spark
12553	sparrow
12554	sparse
12555	spatial
12556	speak
12557	speak English
12558	speak highly of
12559	speak of
12560	speak one's mind
12561	speak out
12562	speak out against
12563	speak up
12564	speaker
12565	speakers
12566	spear
12567	special
12568	special conditions
12569	special offer
12570	specialisation
12571	specialist
12572	specialize
12573	specially
12574	specialty
12575	species
12576	specific
12577	specifically
12578	specified
12579	spectacle
12580	spectacular
12581	spectator
12582	spectrum
12583	speech
12584	speech recognition
12585	speed
12586	speed by
12587	speed up
12588	speediness
12589	spell
12590	spell into
12591	spell out
12592	spell sth. out
12593	spellbind
12594	spelling
12595	spend
12596	spend (time)
12597	spend ... doing ...
12598	spend ...(in) doing ...
12599	spend time
12600	spend time doing sth.
12601	spend time on sth
12602	spent
12603	sphere
12604	spice
12605	spice up ... with
12606	spicy
12607	spider
12608	Spiderman
12609	Spider-Man
12610	spike
12611	spill
12612	spin
12613	spinach
12614	spinning top
12615	spin-off
12616	spirit
12617	spirits
12618	spiritual
12619	spit
12620	splash
12621	splashdown
12622	splendid
12623	splendour
12624	split
12625	split off from
12626	split up
12627	spoil
12628	spoke
12629	spoken
12630	spokesman
12631	spokeswoman
12632	sponsor
12633	spoon
12634	spoon of
12635	spoonful
12636	sport
12637	sporting
12638	sport-lover
12639	sports
12640	sports centre
12641	sports day
12642	Sports Day
12643	sports field
12644	sports meet
12645	sports meeting
12646	sports shoes
12647	sportsman
12648	sportsmanship
12649	sportspeople
12650	sportsperson
12651	sportswear
12652	sportswoman
12653	spot
12654	spotless
12655	spotlight
12656	spots
12657	spotted
12658	spout
12659	sprain
12660	sprained
12661	spray
12662	spread
12663	spread ... to ...
12664	spread around
12665	spread to ...
12666	spreadsheet
12667	spreadsheet software
12668	spring
12669	Spring Festival
12670	spring outing
12671	spring plowing
12672	spring up
12673	springboard
12674	springtime
12675	springy
12676	sprout
12677	spur
12678	spy
12679	spy on
12680	spyglass
12681	squad
12682	square
12683	square kilometre
12684	squash
12685	squatter
12686	squeak
12687	squeal
12688	squeeze
12689	squeeze out
12690	squint
12691	squire
12692	squirrel
12693	Sri Chinmoy
12694	ssh
12695	St Lawrence River
12696	St Paul's Cathedral
12697	St Petersburg
12698	stab
12699	stable
12700	stack
12701	stadium
12702	staff
12703	stage
12704	stagger
12705	staging
12706	stagnant market
12707	stain
12708	stainless
12709	stainless steel
12710	stair
12711	stairs
12712	stalk
12713	stall
12714	stamina
12715	stamp
12716	stamp one's feet
12717	stampede
12718	stamps
12719	stance
12720	stand
12721	stand against/upon
12722	stand by
12723	stand for
12724	stand in line
12725	stand in one's path
12726	stand on one foot
12727	stand on one's head
12728	stand out
12729	stand sb in good stead
12730	stand tall with your head high and your shoulders straight
12731	stand the test
12732	stand up
12733	stand up for
12734	Stand up.
12735	stand-alone operating system
12736	standard
12737	standardisation
12738	standing
12739	stand-up
12740	staple
12741	star
12742	star in
12743	star sign
12744	starchy
12745	stare
12746	stare at
12747	stare back at ...
12748	starfish
12749	starfruit
12750	starry
12751	stars
12752	start
12753	start out
12754	start out from ...
12755	start up
12756	start with
12757	started
12758	started to buy things
12759	started to speak
12760	started to study English
12761	started to use a computer
12762	starter
12763	starting point
12764	startle
12765	starvation
12766	starve
12767	state
12768	stated
12769	statement
12770	statesman
12771	statesmanlike
12772	stateswoman
12773	station
12774	stationery
12775	statistic
12776	statistics
12777	statue
12778	Statue of Liberty
12779	statuette
12780	status
12781	stay
12782	stay abreast of
12783	stay after school
12784	stay at home
12785	stay awake
12786	stay away from
12787	stay away from ...
12788	stay calm
12789	stay deep in the mountains
12790	stay healthy
12791	stay home
12792	stay in a hotel
12793	stay in bed
12794	stay in shape
12795	stay in touch (with sb.)
12796	stay in touch with ...
12797	stay out
12798	stay the same
12799	stay tuned
12800	stay up
12801	stay up all night
12802	stay up all night studying
12803	stay up late
12804	stay with my aunt and uncle
12805	stayed
12806	stayed at home
12807	stead
12808	steadily
12809	steady
12810	steak
12811	steak tartare
12812	steal
12813	steal glances at
12814	steam
12815	steam engine
12816	steamboat
12817	Steamboat Willie
12818	steamed
12819	steamed bread
12820	steed
12821	steel
12822	Steen
12823	steep
12824	Stegosaurus
12825	stem
12826	stem cell
12827	step
12828	step forward to
12829	step into
12830	step on
12831	step up
12832	Stephen Hawking
12833	stepmother
12834	stepsister
12835	stereo
12836	sterile
12837	stethoscope
12838	Steve
12839	Steven
12840	stew
12841	steward
12842	stewardess
12843	Stewart Island
12844	stick
12845	stick out of
12846	stick out of sth.
12847	stick out one's tongue at someone
12848	stick to
12849	stick to (doing) sth.
12850	stick to sth.
12851	stick together
12852	stick with
12853	sticker
12854	sticky
12855	stiff
12856	stiffen
12857	stiffly
12858	still
12859	still life
12860	stimulate
12861	stimulating
12862	stimulus
12863	sting
12864	stink
12865	stir
12866	stir-fry
12867	stitch
12868	stock
12869	stockade
12870	Stockholm
12871	stocking
12872	stockings
12873	stockroom
12874	stomach
12875	stomach ache
12876	stomachache
12877	stone
12878	Stone Forest
12879	Stonehenge
12880	stony
12881	stool
12882	stoop
12883	stop
12884	stop ...(from) doing ...
12885	stop doing ...
12886	stop doing sth
12887	stop sb. (from) doing sth.
12888	stop sign
12889	stop sth. in its tracks
12890	stoplight
12891	stopped
12892	stopwatch
12893	storage
12894	storage device
12895	storage media
12896	storage medium
12897	store
12898	store of value
12899	storehouse
12900	storeowner
12901	storey
12902	stories
12903	storing
12904	storm
12905	stormy
12906	story
12907	story board
12908	storyboard
12909	storybook
12910	storyteller
12911	stout
12912	stove
12913	straight
12914	straight away
12915	straighten
12916	straighten out
12917	straightforward
12918	strain
12919	strait
12920	strange
12921	strangely
12922	stranger
12923	strangle
12924	strap
12925	strategy
12926	Stratford-on-Avon
12927	straw
12928	strawberries
12929	strawberry
12930	streak
12931	stream
12932	stream of thought
12933	streaming
12934	streaming auto
12935	streaming video
12936	street
12937	street cleaner
12938	street sweeper
12939	streetcar
12940	strength
12941	strengthen
12942	stress
12943	stress the importance of ...
12944	stressed
12945	stressful
12946	stretch
12947	stretch out
12948	strict
12949	strictly
12950	strictness
12951	stride
12952	strike
12953	strike ... into one's heart
12954	strike a match
12955	striker
12956	striking
12957	string
12958	string bean
12959	strip
12960	stripe
12961	striped
12962	strive
12963	stroke
12964	strong
12965	strong points
12966	stronger
12967	strongly
12968	structure
12969	struggle
12970	struggle against
12971	stubborn
12972	stubbornly
12973	stuck
12974	stud
12975	student
12976	student council
12977	studied
12978	studies
12979	studio
12980	study
12981	study tip
12982	stuff
12983	stuffed
12984	stuffing
12985	stumble
12986	stunt
12987	stuntman
12988	stupefied
12989	stupid
12990	stupidity
12991	style
12992	stylised
12993	stylish
12994	stylize
12995	subcontinent
12996	subject
12997	subject matter
12998	subjective
12999	submarine
13000	submenu
13001	submerge
13002	submission
13003	submit
13004	subscribe
13005	subscribe (to)
13006	subscribe to
13007	subscription
13008	subsequent
13009	subsistence living
13010	substance
13011	substitute
13012	subtitle
13013	subtle
13014	subtlety
13015	subtropical
13016	suburb
13017	suburban
13018	subway
13019	subwoofer
13020	sub-zero
13021	succeed
13022	succeed in
13023	succeed in (doing) sth.
13024	succeed in doing sth
13025	succeed in doing sth.
13026	succeed to ...
13027	succeeding
13028	success
13029	successful
13030	successfully
13031	such
13032	such ... that
13033	such as
13034	suck
13035	Sudan
13036	sudden
13037	suddenly
13038	sue
13039	Sue
13040	suffer
13041	suffer from
13042	suffer from ...
13043	suffer through
13044	suffering
13045	sufficient
13046	suffix
13047	suffocate
13048	sugar
13049	sugar bush
13050	sugary
13051	suggest
13052	suggestion
13053	suit
13054	suitable
13055	suitcase
13056	suite
13057	suited
13058	sullenly
13059	sum
13060	sum up
13061	summarise
13062	summarize
13063	summary
13064	summer
13065	summer camp
13066	Summer Games
13067	summer holiday
13068	Summer Olympics
13069	Summer Palace
13070	summer vacation
13071	summit
13072	sun
13073	Sun Moon Lake
13074	sunbathe
13075	sun-blindness
13076	sunburned
13077	sunburnt
13078	suncream
13079	Sunday
13080	sunflower
13081	sunglasses
13082	sunlight
13083	sunny
13084	sunrise
13085	sunset
13086	sunshine
13087	sunspot
13088	super
13089	superannuation
13090	superb
13091	superficial
13092	superficially
13093	superhero
13094	superhighway
13095	superior
13096	superman
13097	supermarket
13098	supernatural
13099	superpower
13100	superscalar
13101	supersonic
13102	superstar
13103	supper
13104	supplement
13105	supplementary
13106	supply
13107	support
13108	supporter
13109	supporting
13110	suppose
13111	suppress
13112	supreme
13113	sure
13114	sure enough
13115	surely
13116	surf
13117	surf the Internet
13118	surface
13119	surfboard
13120	surfer
13121	surfing
13122	surfing the Web
13123	surge
13124	surgeon
13125	surgery
13126	surpass
13127	surplus
13128	surprise
13129	surprised
13130	surprising
13131	surprisingly
13132	surrender
13133	surround
13134	surrounding
13135	surroundings
13136	survey
13137	survival
13138	survival kit
13139	survive
13140	survivor
13141	Susan
13142	sushi
13143	suspect
13144	suspected
13145	suspend
13146	suspense
13147	suspension
13148	suspension bridge
13149	suspicion
13150	sustainable
13151	sutra
13152	SVGA
13153	swagman
13154	swallow
13155	swam
13156	swan
13157	Swan Lake
13158	swap
13159	sway
13160	swear
13161	sweat
13162	sweater
13163	sweatshirt
13164	sweaty
13165	Sweden
13166	Swedish
13167	sweep
13168	sweep away
13169	sweep over
13170	sweep the floor
13171	sweep up
13172	sweeping
13173	sweet
13174	sweet and sour ribs
13175	sweet dumpling
13176	sweet potato
13177	sweet tooth
13178	sweetness
13179	sweets
13180	sweet-smelling
13181	swell
13182	swell up
13183	swerve
13184	swift
13185	swiftly
13186	swim
13187	swimmer
13188	swimming
13189	swimming cap
13190	swimming goggles
13191	swimming pool
13192	swimsuit
13193	swing
13194	swing dance
13195	swinging
13196	swirl
13197	switch
13198	switch off
13199	switch on
13200	switch over
13201	Switzerland
13202	swollen
13203	swoop
13204	swoop down
13205	sword
13206	Sydney
13207	Sydney Harbour Bridge
13208	Sydney Opera House
13209	syllable
13210	syllabus
13211	symbol
13212	symbolic
13213	symbolic ambassador
13214	symbolical
13215	symbolically
13216	symbolise
13217	symbolism
13218	symbolize
13219	symmetry
13220	sympathetic
13221	sympathetically
13222	sympathize
13223	sympathize with sb. over sth.
13224	sympathy
13225	symphony
13226	symposium
13227	symptom
13228	syncopation
13229	syndrome
13230	synergy
13231	synonym
13232	synthesizer
13233	syrup
13234	system
13235	system board
13236	system clock
13237	system software
13238	system unit
13239	systematic
13240	T.B.
13241	tabby
13242	table
13243	table manners
13244	table tennis
13245	tablecloth
13246	tablet
13247	taboo
13248	tackle
13249	tact
13250	tactful
13251	tactic
13252	tactile
13253	tadpole
13254	tae kwon do
13255	tag
13256	Tahiti
13257	t'ai chi
13258	Tai Chi
13259	taikonaut
13260	tail
13261	tail off
13262	tailor
13263	tailor-made
13264	Taipei
13265	Taj Mahal
13266	take
13267	take (me) out
13268	take (unfair) advantage of ...
13269	take ... all out of
13270	take ... apart
13271	take ... as
13272	take ... as ...
13273	take ... as an example
13274	take ... for granted
13275	take ... from
13276	take ... into
13277	take ... into account
13278	take ... into consideration
13279	take ... measures
13280	take ... off
13281	take ... out
13282	take ... seriously
13283	take ... to prison
13284	take a bath
13285	take a breath
13286	take a bus
13287	take a chance
13288	take a dancing class
13289	take a deep breath
13290	take a firm hold of
13291	take a glance at
13292	take a look
13293	take a look at
13294	take a message
13295	take a peek
13296	take a photo
13297	take a picture
13298	take a rest
13299	take a risk
13300	take a seat
13301	take a shower
13302	take a swing
13303	take a test
13304	take a tour
13305	take a trip
13306	take a trip to
13307	take a vacation
13308	take a walk
13309	take action
13310	take advantage of
13311	take advantage of sb./sth.
13312	take advice
13313	take after
13314	take an exam
13315	take an interest in
13316	take an interest in ...
13317	take an X-ray
13318	take apart
13319	take away
13320	take breaks
13321	take Bus 42
13322	take care
13323	take care of
13324	take care of sb./sth.
13325	take care to
13326	take charge of
13327	take command of
13328	take control
13329	take control of
13330	take delight in
13331	take down
13332	take energy from ...
13333	take exercise
13334	take for granted
13335	take hold of
13336	take in
13337	take it easy
13338	take lessons
13339	take liberties with
13340	take measures to do sth.
13341	take medicine
13342	take notes
13343	take notice of
13344	take notice of sth.
13345	take off
13346	Take off your (shoes).
13347	take on
13348	take one's advice
13349	take one's mind off
13350	take one's order
13351	take one's own life
13352	take one's place
13353	take one's seat
13354	take one's share
13355	take one's temperature
13356	take out
13357	take out the rubbish
13358	take over
13359	take part
13360	take part (in sth.)
13361	take part in
13362	take photos
13363	take pictures
13364	take place
13365	take pleasure in
13366	take possession of
13367	take precautions
13368	take pride in
13369	take responsibility for sth.
13370	take risks
13371	take sb. away to
13372	take sb. in one's arms
13373	take sb.'s place
13374	take sb.'s temperature
13375	take some form of action
13376	take some medicine
13377	take special care to
13378	take steps to
13379	take steps to ...
13380	take the bus
13381	take the fall
13382	take the first right
13383	take the form of
13384	take the lead
13385	take the place of
13386	take the subway
13387	take the throne
13388	take the throne back
13389	take to
13390	take to ...
13391	take turns
13392	take up
13393	take up sth.
13394	take up the habit ...
13395	take/play a role in/on ...
13396	takeaway
13397	taken
13398	takeoff
13399	takeout
13400	tale
13401	talent
13402	talent show
13403	talented
13404	talk
13405	talk ... into ...
13406	talk about
13407	talk about/of
13408	talk back
13409	talk on the police radio
13410	talk over
13411	talk quietly
13412	talk sb. into doing sth.
13413	talk show
13414	talk somebody into doing something
13415	talk sth. over with sb.
13416	talk to
13417	talk to ...
13418	talkative
13419	talked
13420	talking
13421	tall
13422	taller
13423	tallest
13424	tame
13425	tangible
13426	tangle
13427	tangled
13428	tango
13429	tangyuan
13430	tank
13431	Tanzania
13432	Taoism
13433	tap
13434	tap dancing
13435	tape
13436	tape drive
13437	tape player
13438	Tara
13439	target
13440	task
13441	taste
13442	tasteless
13443	tasty
13444	tattoo
13445	taught
13446	tax
13447	tax minmisation scheme
13448	taxation
13449	tax-free
13450	taxi
13451	taxi driver
13452	taxpayer
13453	Taylor
13454	tea
13455	tea art
13456	tea biscuit
13457	tea ceremony
13458	tea party
13459	tea set
13460	teabag
13461	teach
13462	teach sports
13463	teacher
13464	Teachers' Day
13465	teacher's desk
13466	teachers' office
13467	teachers' room
13468	teaching
13469	teacup
13470	teahouse
13471	team
13472	team player
13473	team up with
13474	teammate
13475	teamwork
13476	teapot
13477	tear
13478	tear ... to pieces
13479	tear down
13480	tear off
13481	tear sth. away
13482	teardrop
13483	tearfully
13484	tease
13485	teasing
13486	technical
13487	technically
13488	technician
13489	technique
13490	technological
13491	technology
13492	tectonic
13493	Ted
13494	teddy bear
13495	Teddy Bear
13496	teen
13497	teenage
13498	teenager
13499	teens
13500	teeth
13501	telecom
13502	telecommunication
13503	telecommuting
13504	telegram
13505	telegraph
13506	Telemachus
13507	telemedicine
13508	telephone
13509	telephone/phone number
13510	telescope
13511	telesurgery
13512	television
13513	tell
13514	tell ... apart
13515	tell ... from
13516	tell a lie
13517	tell a story
13518	tell by
13519	tell jokes
13520	tell of ...
13521	tell off
13522	tell something apart
13523	tell stories
13524	telly
13525	temper
13526	temperature
13527	temple
13528	temple fair
13529	temporarily
13530	temporary
13531	tempt
13532	tempt sb. with ...
13533	temptation
13534	ten
13535	tend
13536	tend to
13537	tend to (do sth)
13538	tend to ...
13539	tendency
13540	tender
13541	Tennessee
13542	tennis
13543	tense
13544	tension
13545	tent
13546	tentacle
13547	tentative
13548	tentatively
13549	tenth
13550	Tenzing Norgay
13551	Teresa
13552	Teresa Lopez
13553	term
13554	term deposit
13555	terminal
13556	Terra Cotta Warrior
13557	terrace
13558	terracotta
13559	Terracotta Warriors
13560	Terra-cotta Warriors
13561	terrible
13562	terribly
13563	terrific
13564	terrified
13565	terrify
13566	terrifying
13567	territory
13568	terror
13569	terrorist
13570	tertiary
13571	Tess of d'Urbevilles
13572	test
13573	test out
13574	testimony
13575	tetrahedron
13576	Texas
13577	text
13578	text message
13579	textbook
13580	textile
13581	Thai
13582	Thailand
13583	than
13584	thank
13585	thank god
13586	thank goodness
13587	Thank goodness!
13588	thank you
13589	thank you for ...
13590	Thank you for inviting me.
13591	Thank you.
13592	thankful
13593	thankfully
13594	thanks
13595	thanks to
13596	thanks to ...
13597	Thanks.
13598	thanksgiving
13599	Thanksgiving
13600	Thanksgiving Day
13601	that
13602	that is
13603	that's
13604	that's all
13605	That's all right.
13606	That's OK.
13607	That's right.
13608	the
13609	the ability to do sth.
13610	the active voice
13611	the Amazon Jungle
13612	the Amazon River
13613	the Andes mountains
13614	the Antarctic
13615	the Arctic
13616	the Arctic Circle
13617	the Atlantic Ocean
13618	the Baltic Sea
13619	The Beatles
13620	the best-built rocket
13621	the Bird's Nest
13622	the box office
13623	the British Museum
13624	the British Royal Philharmonic Orchestra
13625	the Bund
13626	the Canadian Space Agency
13627	the Caspian Sea
13628	The cat has got one's tongue.
13629	the charts
13630	the CN Tower
13631	the command module
13632	the Council of Europe
13633	the couple
13634	the Crimean War
13635	the cross-talk show
13636	the Danube River
13637	the day after tomorrow
13638	the day before yesterday
13639	the Dragon Boat Festival
13640	the Eiffel Tower
13641	the elderly
13642	the era of information
13643	the Faroe Islands
13644	the food chain
13645	the Foundation trilogy
13646	the general public
13647	the Gobi Desert
13648	the Golden Gate Bridge
13649	The Great Lakes
13650	the Great Wall
13651	the Great Wall of China
13652	the greenhouse effect
13653	the heavens
13654	the high jump
13655	the Himalayas
13656	the Hollywood Walk of Fame
13657	the International Gymnastics Championships
13658	the International Olympic Committee
13659	the Lantern Festival
13660	the last minute
13661	the last straw
13662	the living
13663	the London Eye
13664	the long jump
13665	the Louvre
13666	the matter
13667	the Mayflower
13668	the medals table
13669	the media
13670	the Mid-Autumn Festival
13671	the Middle East
13672	the Midwest
13673	the Milky Way
13674	the Ming Dynasty
13675	the Ming Great Wall
13676	the Monkees
13677	the Monkey King
13678	the more ... the more ...
13679	the music charts
13680	the Netherlands
13681	the next day
13682	the Nile
13683	the Nobel Prize
13684	the Norman Conquest
13685	the North Pole
13686	The old Man and the Sea
13687	The Old Man and the Sea
13688	the Olympic Games
13689	the Olympics
13690	the Opera House
13691	the Oriental Pearl Tower
13692	the other day
13693	the other night
13694	the Pacific
13695	the Pacific Ocean
13696	the Palace Museum
13697	the Parana River
13698	the passive voice
13699	the Pentagon
13700	the Pilgrims
13701	the poor
13702	the Potala Palace
13703	the PRC
13704	the Pyramids
13705	The Quarrymen
13706	the Renaissance
13707	the retail industry
13708	the Reuters news agency
13709	the robot lander
13710	the Rocky Mountains
13711	the Sahara
13712	the same ... as
13713	the same ... as ...
13714	the same as
13715	the same size as ...
13716	the Secretary-General
13717	the Silk Road
13718	the Smith family
13719	the solar system
13720	the South Pole
13721	the Spring Festival
13722	the Statue of Liberty
13723	the Stone Age
13724	the Stone Forest
13725	the Straits of Malacca
13726	the Summer Palace
13727	the Temple of Heaven
13728	the Terracotta Army
13729	the thing is
13730	the Three Gorges
13731	the top left-hand corner
13732	the Tree Planting Day
13733	the tropics
13734	the U.S.
13735	the UK
13736	the UN Security Council
13737	the Union Jack
13738	the United Kingdom
13739	the United Nations
13740	the United States
13741	the United States (of America)
13742	the USA
13743	the Vatican City State
13744	the West End of London
13745	the White House
13746	the wild
13747	the woods
13748	the World Intellectual Property Organization
13749	the World Trade Organization
13750	the World Wireless Forum
13751	the worst
13752	the Yangtze River
13753	the Yellow River
13754	the youth
13755	theater
13756	theatre
13757	thee
13758	theft
13759	their
13760	theirs
13761	them
13762	theme
13763	theme park
13764	themselves
13765	then
13766	then and now
13767	theoretical
13768	theory
13769	Theory of Relativity
13770	therapy
13771	there
13772	there are
13773	There are ...
13774	there are, there is
13775	there be no need to do something
13776	there is
13777	There is evidence that ...
13778	there is/are
13779	there was
13780	there wasn't
13781	there were
13782	there weren't
13783	thereby
13784	therefore
13785	therein
13786	There's no doubt that ...
13787	thermometer
13788	thermos
13789	Thermos
13790	thesaurus
13791	these
13792	Theseus
13793	they
13794	they're
13795	they've
13796	thick
13797	thief
13798	thigh
13799	thin
13800	thing
13801	thingamajig
13802	think
13803	think about
13804	think about sth.
13805	think back to
13806	think hard
13807	think highly of
13808	think ill of
13809	think of
13810	think of ... as ...
13811	think over
13812	think to oneself
13813	think twice (about sth)
13814	thinker
13815	thinking
13816	thinner
13817	third
13818	thirdly
13819	thirst
13820	thirsty
13821	thirteen
13822	thirteenth
13823	thirtieth
13824	thirty
13825	thirty-first
13826	this
13827	This is for you.
13828	this way
13829	This way.
13830	thistle
13831	thistledown
13832	Thomas Watson
13833	thorn
13834	thorough
13835	thoroughly
13836	those
13837	thou
13838	though
13839	thought
13840	thoughtful
13841	thousand
13842	thousands of
13843	thread
13844	threat
13845	threaten
13846	threatening
13847	three
13848	three stars
13849	three times
13850	three times a week
13851	thrill
13852	thrilled
13853	thriller
13854	thrilling
13855	throat
13856	throne
13857	through
13858	throughout
13859	throw
13860	throw ... into the air
13861	throw all caution to the winds
13862	throw away
13863	throw light on
13864	throw oneself into
13865	throw oneself on ...
13866	throw oneself on sb.
13867	throw sb./sth. out
13868	throwing
13869	throwing(a ball)
13870	thrust
13871	thumb
13872	thumbs-up
13873	thump
13874	thunder
13875	thunder at sb.
13876	Thunder Bay
13877	thunderstorm
13878	Thursday
13879	thus
13880	Tian'anmen Square
13881	Tibet
13882	Tibetan
13883	Tibetan antelope
13884	tick
13885	tick away
13886	tick tock
13887	ticket
13888	tidal
13889	tide
13890	tide sb. over sth.
13891	tidy
13892	tidy the desk
13893	tidy up
13894	tie
13895	tie knots
13896	tied
13897	tie-in
13898	tiger
13899	tiger lily
13900	tight
13901	tighten
13902	tightly
13903	tightrope
13904	tights
13905	till
13906	till now
13907	Tim
13908	time
13909	time after time
13910	time capsule
13911	Time for ...
13912	time line
13913	time machine
13914	time to go to ...
13915	time-consuming
13916	time-honoured
13917	timeless
13918	timely
13919	times
13920	timetable
13921	timid
13922	timing
13923	Timor
13924	tin
13925	Tina
13926	Tinman
13927	tin-toy
13928	tiny
13929	tip
13930	tip over
13931	tire
13932	tire of
13933	tire out
13934	tired
13935	tiresome
13936	tiring
13937	tissue
13938	Titan
13939	titanic
13940	Titanic
13941	title
13942	title bar
13943	to
13944	to a certain degree
13945	to a certain extent
13946	to a great extent
13947	to be
13948	to be honest
13949	to go
13950	to help somebody out
13951	to name just a few
13952	to one's astonishment
13953	to one's credit
13954	to one's heart's content
13955	to one's name
13956	to one's surprise
13957	to some degree
13958	to start with
13959	to tell you the truth
13960	to the fullest
13961	toast
13962	tobacco
13963	today
13964	toe
13965	toe shoes
13966	tofu
13967	together
13968	together with
13969	together with ...
13970	togetherness
13971	toggle key
13972	toil
13973	toilet
13974	toilet paper
13975	Tokyo
13976	told
13977	tolerance
13978	tolerant
13979	tolerate
13980	toll
13981	Tom
13982	Tom Orde-Lees
13983	Tom Sawyer
13984	tomato
13985	tomatoes
13986	tomb
13987	tomorrow
13988	ton
13989	tone
13990	tongs
13991	tongue
13992	tongue twister
13993	tongue-tied
13994	tonight
13995	tonne
13996	tons of
13997	Tony
13998	too
13999	too ... to ...
14000	too many
14001	too much
14002	took
14003	took off
14004	took photos
14005	took pictures
14006	tool
14007	toot
14008	tooth
14009	toothache
14010	toothbrush
14011	toothbrush and mirror
14012	toothbrush and toothpaste
14013	toothless
14014	toothpaste
14015	toothpaste and toothbrush
14016	top
14017	top secret
14018	top-class
14019	topic
14020	topical
14021	top-ranking
14022	torch
14023	tornado
14024	Toronto
14025	torso
14026	tortilla
14027	tortoise
14028	toss
14029	total
14030	totally
14031	totem
14032	touch
14033	touch on
14034	touch one's heart
14035	touch screen
14036	touch upon
14037	touching
14038	touchpad
14039	touchstone
14040	tough
14041	tour
14042	tour guide
14043	tourism
14044	tourist
14045	tourist office
14046	tourist spot
14047	touristy
14048	tournament
14049	tow
14050	toward
14051	towards
14052	towel
14053	tower
14054	tower above ...
14055	Tower Bridge
14056	town
14057	townhouse
14058	toy
14059	toy bear
14060	toy box
14061	toy car
14062	toy shop
14063	toy with
14064	trace
14065	track
14066	track and field
14067	track event
14068	track meet
14069	track shirt
14070	track team
14071	trackball
14072	tracksuit
14073	tractor
14074	trade
14075	trademark
14076	trader
14077	tradesman
14078	trading
14079	trading post
14080	tradition
14081	traditional
14082	traditionally
14083	traffic
14084	traffic jam
14085	traffic light
14086	traffic lights
14087	tragedy
14088	trail
14089	train
14090	train engineer
14091	train station
14092	trainee
14093	trainer
14094	trainers
14095	training
14096	trait
14097	tram
14098	tramp
14099	tranquil
14100	transcend
14101	transcontinental
14102	transfer
14103	transfer duty
14104	transfer rate
14105	transform
14106	transform ... into
14107	transformation
14108	transfusion
14109	transgenic
14110	transistor
14111	transition
14112	Transkei
14113	translate
14114	translation
14115	translator
14116	transmit
14117	transparent
14118	transparently
14119	transport
14120	transportable
14121	transportation
14122	transporter
14123	trap
14124	trapped
14125	trash
14126	trash can
14127	travel
14128	travel agent
14129	travel around the world
14130	travel at the speed of light
14131	travel guide
14132	traveled
14133	traveler
14134	traveller
14135	travelling
14136	tread
14137	treasure
14138	treasure hunt
14139	Treasure Island
14140	treat
14141	treat ... as
14142	treat ... as ...
14143	treat oneself to sth.
14144	treat sb. to dinner
14145	treatment
14146	treaty
14147	tree
14148	Tree Planting Day
14149	Tree-planting Day
14150	trek
14151	tremble
14152	trembling
14153	tremendous
14154	tremendously
14155	trench
14156	trend
14157	trendy
14158	Trent
14159	T-Rex
14160	trial
14161	triangle
14162	triangular
14163	triathlon
14164	tribal
14165	tribe
14166	tribesman
14167	Triceratops
14168	trick
14169	trick or treat
14170	trick sb. into doing sth.
14171	tricky
14172	tricycle
14173	trifle
14174	trigger
14175	trilogy
14176	trim
14177	Trinidad
14178	trip
14179	trip over
14180	triumph
14181	trivial
14182	Trojan
14183	Trojan horse
14184	trolleybus
14185	troop
14186	trophy
14187	tropic
14188	tropical
14189	trouble
14190	troublesome
14191	trough
14192	trousers
14193	truant
14194	truck
14195	trucking
14196	true
14197	true-to-life
14198	truly
14199	trumpet
14200	trunk
14201	trunk library
14202	trust
14203	trusting
14204	trustworthy
14205	truth
14206	truthful
14207	try
14208	try ... on
14209	try every means to do
14210	try it on
14211	try on
14212	try one's best
14213	try one's best to do sth.
14214	try out
14215	try out for something
14216	try out for sth
14217	try to do ...
14218	T-shirt
14219	tsunami
14220	tub
14221	tube
14222	Tuesday
14223	tug
14224	tulip
14225	tumble
14226	tummy
14227	tumult
14228	tuna
14229	tune
14230	tune in
14231	tuneful
14232	Tunisia
14233	tunnel
14234	turbulent
14235	ture
14236	Turk
14237	turkey
14238	Turkey
14239	turn
14240	turn ... away
14241	turn ... into
14242	turn ... into ...
14243	turn ... over
14244	turn ... upside down
14245	turn around
14246	turn away
14247	turn away from
14248	turn back
14249	turn down
14250	turn in
14251	turn into
14252	turn into ...
14253	turn left
14254	Turn left at the ... crossing.
14255	turn off
14256	turn off (the TV)
14257	turn on
14258	Turn on the lights.
14259	turn on (the light)
14260	turn one's back to
14261	turn out
14262	turn over
14263	turn over a new leaf
14264	turn right
14265	Turn right at the ... crossing.
14266	turn round
14267	turn sb. off
14268	turn sth. over
14269	turn swords into plowshares
14270	turn to
14271	turn to ...
14272	turn to sb.
14273	turn to somebody/something
14274	turn up
14275	turned
14276	turning
14277	turning point
14278	turnover tax
14279	turntable
14280	Turpan
14281	turtle
14282	tusk
14283	tutor
14284	tutorial
14285	TV
14286	TV camera
14287	TV channel
14288	TV guide
14289	TV series
14290	TV set
14291	TV show
14292	TV special
14293	tweet
14294	tweet tweet
14295	twelfth
14296	twelve
14297	twentieth
14298	twenty
14299	twenty-eight
14300	twenty-eighth
14301	twenty-fifth
14302	twenty-first
14303	twenty-fourth
14304	twenty-ninth
14305	twenty-one
14306	twenty-second
14307	twenty-seventh
14308	twenty-sixth
14309	twenty-third
14310	twice
14311	twice a week
14312	twice a year
14313	twilight
14314	twin
14315	twin towers
14316	twine
14317	twinkle
14318	twirl
14319	twist
14320	twisted
14321	twisting
14322	twitch
14323	two
14324	two peas in a pod
14325	two thirds
14326	two-way
14327	tycoon
14328	type
14329	type letters
14330	typeset
14331	typesetting
14332	typewriter
14333	typhoon
14334	typical
14335	typically
14336	typist
14337	Tyrannosaurus rex
14338	tyranny
14339	tyrant
14340	tyre
14341	U.K.
14342	U.S.
14343	UFO
14344	Uganda
14345	ugh
14346	ugly
14347	uh
14348	uh huh
14349	UK
14350	ultimate
14351	ultimately
14352	ultraviolet
14353	Uluru
14354	umbrella
14355	UN conference
14356	unable
14357	unaccompanied
14358	unalienable
14359	unanimous
14360	unannounced
14361	unattended
14362	unavoidable
14363	unaware
14364	unaware of
14365	unbearable
14366	unbeatable
14367	unbelievable
14368	unbelievably
14369	unbelieving
14370	unbutton
14371	uncertain
14372	uncertainty
14373	uncle
14374	unclear
14375	uncomfortable
14376	uncomfortably
14377	uncommon
14378	uncomprehending
14379	uncompress
14380	unconditional
14381	unconditionally
14382	unconscious
14383	unconsciously
14384	unconventional
14385	uncooperative
14386	uncover
14387	uncrowded
14388	under
14389	under construction
14390	under control
14391	under one's guidance
14392	under the control of
14393	under the influence of ...
14394	under the name (of) ...
14395	under the name of ...
14396	under the rule of
14397	under the umbrella of
14398	under the weather
14399	under way
14400	underdog
14401	undergo
14402	underground
14403	undergrowth
14404	underline
14405	underneath
14406	underpants
14407	underpass
14408	understand
14409	understandable
14410	understanding
14411	undertake
14412	underwater
14413	underway
14414	underwear
14415	undesirable
14416	undismayed
14417	undisturbed
14418	undivided
14419	undo
14420	undoubtedly
14421	uneasily
14422	uneasy
14423	unemployed
14424	unemployment
14425	unemployment benefit
14426	unending
14427	unequalled
14428	unexpected
14429	unexpectedly
14430	unexplained
14431	unexpressed
14432	unfair
14433	unfamiliar
14434	unfit
14435	unfold
14436	unforgettable
14437	unformed
14438	unfortunate
14439	unfortunately
14440	unfriendly
14441	unhappy
14442	unhealthy
14443	unhurried
14444	unhygienic
14445	Unicode
14446	uniform
14447	Uniform Resource Locator
14448	unify
14449	unimaginable
14450	unimaginative
14451	unimagined
14452	uninhabited
14453	uninstaller
14454	union
14455	unique
14456	uniqueness
14457	unit
14458	unit price
14459	unite
14460	United States
14461	unity
14462	universal
14463	universal serial bus port
14464	universe
14465	university
14466	UNIX
14467	unjust
14468	unknown
14469	unless
14470	unlighted
14471	unlike
14472	unlikely
14473	unload
14474	unloved
14475	unluckily
14476	unlucky
14477	unmanned
14478	unmarried
14479	unmistakably
14480	unpack
14481	unpaid
14482	unpleasant
14483	unpredictable
14484	unprocessed
14485	unprofessional
14486	unprotected
14487	unrealistic
14488	unrecognisable
14489	unrest
14490	unruly
14491	unsafe
14492	unseen
14493	unselfishness
14494	unsettling
14495	unsinkable
14496	unsociable
14497	unspeakable
14498	unspoken
14499	unsuccessful
14500	unsuitable
14501	unsuited
14502	unsung
14503	unsure
14504	unsurprisingly
14505	unsuspected
14506	unsuspecting
14507	untapped
14508	untidy
14509	untie
14510	until
14511	unto
14512	unusual
14513	unusually
14514	unwanted
14515	unwary
14516	unwelcome
14517	unwilling
14518	unwillingly
14519	unwillingness
14520	unwise
14521	unworthy
14522	unwrap
14523	unyielding
14524	unzip
14525	up
14526	up against
14527	up and down
14528	up close
14529	up to
14530	up to ...
14531	up to date
14532	up to now
14533	up to standard
14534	upbringing
14535	update
14536	uploading
14537	upon
14538	upper
14539	upright
14540	uprightness
14541	uprising
14542	ups and downs
14543	upset
14544	upside
14545	upside down
14546	upstairs
14547	up-to-date
14548	upward
14549	upwards
14550	upwards of
14551	Uranus
14552	urban
14553	urge
14554	urge sb. to do sth.
14555	urgent
14556	URL
14557	Uruguay
14558	Urumqi
14559	us
14560	US
14561	USA
14562	usage
14563	USB 2.0
14564	USB hub
14565	USB port
14566	USBDriveTM
14567	use
14568	use up
14569	used
14570	used to
14571	useful
14572	useless
14573	user
14574	user interface
14575	user response
14576	user-friendly
14577	usher
14578	usual
14579	usually
14580	usurpation
14581	Utah
14582	utility
14583	utility program
14584	Utopia
14585	utter
14586	utterly
14587	vacancy
14588	vacant
14589	vacation
14590	vaccination
14591	vacuum
14592	vague
14593	vaguely
14594	vain
14595	valentine
14596	Valentine's Day
14597	valid
14598	valley
14599	valuable
14600	value
14601	valued
14602	Vancouver
14603	vanguard
14604	vanilla
14605	vanish
14606	vapour
14607	variable expenditure
14608	variation
14609	varied
14610	variety
14611	variety show
14612	various
14613	vary
14614	vary from ... to ...
14615	vase
14616	vast
14617	vault
14618	VCD
14619	VCR
14620	vegetable
14621	vegetables
14622	vegetarian
14623	vehicle
14624	vein
14625	velvet
14626	vend
14627	vending machine
14628	vengeful
14629	venom
14630	venomous
14631	venture
14632	venue
14633	Venus
14634	Vera
14635	verb
14636	verbal
14637	versatile
14638	verse
14639	version
14640	vertical
14641	very
14642	very much
14643	VESA
14644	vessel
14645	vest
14646	vet
14647	veteran
14648	veterinarian
14649	veto
14650	veto power
14651	via
14652	vice
14653	vice-
14654	vice versa
14655	victim
14656	Victor
14657	Victor Hugo
14658	Victoria lily
14659	victorious
14660	victory
14661	video
14662	video arcade
14663	video camera
14664	video capture card
14665	video card
14666	video cassette
14667	video game
14668	video input
14669	video screen
14670	video shop
14671	videophone
14672	videotape
14673	Vietnam
14674	Vietnamese
14675	view
14676	viewer
14677	viewpoint
14678	vigilant
14679	vigorous
14680	vigour
14681	Viking
14682	village
14683	villager
14684	Vince
14685	vine
14686	vinegar
14687	vineyard
14688	violate
14689	violation
14690	violence
14691	violent
14692	violet
14693	violin
14694	violinist
14695	Virginia City
14696	virtual
14697	virtual memory
14698	virtual reality
14699	virtually
14700	virtue
14701	virus
14702	virus author
14703	visa
14704	visible
14705	vision
14706	visit
14707	visit one's grandparents
14708	visit the Mogao Caves
14709	visited
14710	visited grandparents
14711	visiting
14712	visiting student
14713	visitor
14714	visual
14715	visualise
14716	visually
14717	visuals
14718	vital
14719	vitamin
14720	Vivian
14721	vivid
14722	vividly
14723	vocabulary
14724	vocal
14725	vocation
14726	vocational
14727	voice
14728	voice input
14729	voice mail
14730	voice output
14731	voice over
14732	voice recognition
14733	voice recognition programs
14734	void
14735	volatile memory
14736	volcanic
14737	volcanic eruption
14738	volcano
14739	volcanoes
14740	volcanologist
14741	volcanology
14742	volleyball
14743	volume
14744	voluminous
14745	voluntarily
14746	voluntary
14747	voluntary work
14748	volunteer
14749	vomit
14750	vote
14751	vote for
14752	voting
14753	vowel
14754	voyage
14755	vulnerable
14756	waffle
14757	wag
14758	wage
14759	wagon
14760	waist
14761	wait
14762	wait a minute
14763	Wait a minute.
14764	wait a moment
14765	wait and see
14766	wait for
14767	wait for sb./sth.
14768	wait in a queue for
14769	wait in line
14770	waiter
14771	waiting room
14772	waitress
14773	wake
14774	wake (up)
14775	wake ... up
14776	wake sb. up
14777	wake up
14778	Wales
14779	walk
14780	walk by
14781	walk into
14782	walk off
14783	walk on
14784	walk right up to
14785	walk the dog
14786	walk to school
14787	Walk.
14788	walkathon
14789	walked
14790	walker
14791	walking
14792	walking stick
14793	walking the dog
14794	walks of life
14795	wall
14796	wallet
14797	walnut
14798	Walt Disney
14799	Walter Cunningham
14800	waltz
14801	wander
14802	wanderer
14803	want
14804	wanted
14805	war
14806	war memorial
14807	ward
14808	warden
14809	Wardian case
14810	wardrobe
14811	warehouse
14812	warfare
14813	wariness
14814	warlike
14815	warm
14816	warm ... up
14817	warm boot
14818	warm up
14819	warm-hearted
14820	warming
14821	warmly
14822	warmth
14823	warm-up
14824	warn
14825	warn sb. of
14826	warning
14827	warrior
14828	Warsaw
14829	wartime
14830	was
14831	was born
14832	was/were
14833	wash
14834	wash (your) hands
14835	wash ... face
14836	wash away
14837	wash clothes
14838	wash my clothes
14839	wash sb./sth. away
14840	wash the dishes
14841	washed
14842	washed clothes
14843	washed out
14844	washer
14845	washing machine
14846	Washington D.C.
14847	washroom
14848	wasn't
14849	wasp
14850	waste
14851	waste paper basket
14852	waste time doing
14853	wastebasket
14854	wastepaper
14855	watch
14856	watch a film
14857	watch a movie
14858	watch films
14859	watch for
14860	watch out
14861	watch out for
14862	watch over
14863	watch TV
14864	watched
14865	watched TV
14866	watches
14867	watching TV
14868	watchmaker
14869	watchtower
14870	water
14871	water bottle
14872	water buffalo
14873	Water Festival
14874	water fountain
14875	water lily
14876	water skiing
14877	water sports
14878	water the plants
14879	water vapour
14880	watercolour
14881	watercress
14882	waterfall
14883	waterfront
14884	watering can
14885	watering the plants
14886	watermelon
14887	waterproof
14888	water-ski
14889	waterskiing
14890	watertight
14891	waterway
14892	watery
14893	wave
14894	wave one's hand
14895	wavy
14896	wax
14897	wax disk
14898	way
14899	WBT
14900	we
14901	weak
14902	weak points
14903	weaken
14904	weakling
14905	weakness
14906	wealth
14907	wealthy
14908	weapon
14909	wear
14910	wear glasses
14911	wear off
14912	wear somebody out
14913	wearable
14914	wearer
14915	weariness
14916	wearing
14917	weary
14918	weather
14919	weather forecast
14920	weather map
14921	weather report
14922	weatherman
14923	weave
14924	weave around ...
14925	weaver
14926	web
14927	Web
14928	Web address
14929	Web browser
14930	Web hosting services
14931	web page
14932	Web page
14933	Web page authoring
14934	Web publishing
14935	Web server
14936	Web site
14937	Web-based help
14938	website
14939	wedding
14940	wedge
14941	Wednesday
14942	weed
14943	weed the garden
14944	week
14945	weekday
14946	weekend
14947	weekly
14948	weep
14949	weeper
14950	weigh
14951	weigh down
14952	weigh up to
14953	weight
14954	weight lifting
14955	weightlessly
14956	weightlifter
14957	weightlifting
14958	weight-lifting
14959	weight-loss
14960	welcome
14961	welcome (to)
14962	Welcome back to ...
14963	Welcome back!
14964	Welcome to ...
14965	Weld Quay
14966	welfare
14967	well
14968	we'll
14969	Well done!
14970	Well done.
14971	well-argued
14972	well-balanced
14973	well-being
14974	well-built
14975	well-dressed
14976	well-educated
14977	Wellington
14978	well-kept
14979	well-known
14980	well-lit
14981	well-meaning
14982	well-off
14983	well-organized
14984	well-paid
14985	well-rounded education
14986	went
14987	went camping
14988	went fishing
14989	went to kindergarten
14990	went to school
14991	went to the beach
14992	were
14993	we're
14994	weren't
14995	west
14996	West
14997	West Hill
14998	West Lake
14999	western
15000	Western
15001	westerner
15002	Westerner
15003	western-style
15004	Westminster Abbey
15005	westward
15006	westwards
15007	wet
15008	Wet floor.
15009	wetland
15010	wetness
15011	we've
15012	whale
15013	wham
15014	wharf
15015	what
15016	what ... for ...
15017	What a ...!
15018	What a nice cake!
15019	what a pity
15020	What a pity!
15021	what a shame ...
15022	What a shame!
15023	what about
15024	What about ...?
15025	What about you?
15026	What can I do for you?
15027	what color
15028	What colour ...?
15029	What day is it today?
15030	What day is today?
15031	What do you like to do on holidays?
15032	What do you think of ...?
15033	What do you think?
15034	What does he/she look like?
15035	What does it mean?
15036	What does she do? She is a ...
15037	What does she look like?
15038	What happened?
15039	what if
15040	What is ... like?
15041	What is it for?
15042	what is more
15043	what kind(s) of
15044	What kinds of ...?
15045	What makes you tick?
15046	what time
15047	What time is it?
15048	What would you like to buy?
15049	What would you like?
15050	What?
15051	whatever
15052	what-if analysis
15053	what's
15054	What's for breakfast?
15055	what's more
15056	What's on ...?
15057	What's the date?
15058	What's the matter?
15059	What's the weather like?
15060	What's this?
15061	What's up?
15062	What's wrong with ...?
15063	What's wrong with you?
15064	What's wrong?
15065	What's your favourite food?
15066	What's your name?
15067	What's your opinion on ...?
15068	wheat
15069	wheel
15070	wheelchair
15071	when
15072	When it comes to ...
15073	whenever
15074	where
15075	whereabouts
15076	whereas
15077	where's
15078	wherever
15079	whether
15080	whether ... or not
15081	whether or not
15082	which
15083	whichever
15084	while
15085	whilst
15086	whip
15087	whirl
15088	whirlpool
15089	whisker
15090	whisper
15091	whistle
15092	Whitcomb Judson
15093	white
15094	White
15095	White House
15096	whiteboard
15097	white-flag dolphin
15098	white-water rafting
15099	Whitney
15100	who
15101	whoever
15102	whole
15103	whole grains
15104	wholeness
15105	wholesome
15106	whom
15107	whoops
15108	who's
15109	who's this
15110	whose
15111	why
15112	why don't we?
15113	Why not ...?
15114	Why not?
15115	Why?
15116	wicked
15117	wide
15118	widely
15119	widespread
15120	widow
15121	width
15122	wife
15123	wig
15124	wild
15125	wild goose
15126	Wild Goose Pagoda
15127	Wild Man of Shennongjia
15128	WildAid
15129	wilderness
15130	wildest
15131	wildlife
15132	wildly
15133	will
15134	will power
15135	William Shakespeare
15136	William Tyndale
15137	willing
15138	willow
15139	win
15140	win ... back
15141	win first prize
15142	win the heart of sb.
15143	wind
15144	wind one's way
15145	wind sb. up
15146	wind up
15147	wind-bell
15148	windbreaker
15149	winding
15150	windmill
15151	window
15152	Windows Explorer
15153	Windows XP
15154	Windsor Castle
15155	windstorm
15156	windsurfing
15157	windy
15158	wine
15159	wing
15160	winner
15161	winning
15162	winter
15163	Winter Camp
15164	Winter Games
15165	winter holiday
15166	winter jasmine
15167	Winter Olympics
15168	wipe
15169	wipe away
15170	wipe out
15171	wire
15172	wireless
15173	wisdom
15174	wise
15175	wisely
15176	wish
15177	wish for
15178	wit
15179	witch
15180	witchcraft
15181	with
15182	with a little thought
15183	with all one's heart
15184	with an average of
15185	with care
15186	with doubt
15187	with great care
15188	with reference to
15189	with the help of
15190	with the highest honours
15191	with the purpose of
15192	with the rapid growth of ...
15193	withdraw
15194	withdraw from ...
15195	withdrawal
15196	within
15197	within arm's reach
15198	within one's reach
15199	without
15200	without any thought
15201	without difficulty
15202	without doubt
15203	without hesitation
15204	without regard to/ for
15205	without the help of
15206	witness
15207	witty
15208	wizard
15209	woke
15210	wolf
15211	wolfie
15212	wolves
15213	woman
15214	women
15215	Women's Day
15216	won
15217	wonder
15218	wonderful
15219	Wonderful!
15220	wonderland
15221	won't
15222	wood
15223	woodcutter
15224	wooden
15225	woods
15226	woof
15227	woofer
15228	wool
15229	woollen
15230	word
15231	word book
15232	word of mouth
15233	word processing
15234	word processing software
15235	word processor
15236	wordless
15237	wore
15238	work
15239	work as
15240	work from home
15241	work hard
15242	work hard at school
15243	work of art
15244	work on
15245	work on sth.
15246	work one's best
15247	work one's way through
15248	work out
15249	work tirelessly behind the scenes
15250	workaholic
15251	workbook
15252	workday
15253	worker
15254	workforce
15255	workhouse
15256	working
15257	working-class
15258	workings
15259	workload
15260	workmanship
15261	workout
15262	workplace
15263	works
15264	worksheet
15265	workshop
15266	world
15267	World Cup
15268	World Trade Center
15269	World Vision
15270	World War Ⅱ
15271	World War II
15272	World Wide Web
15273	World Wide Web Consortium
15274	world-famous
15275	worldly
15276	worldwide
15277	worm
15278	worn
15279	worn out
15280	worn-out
15281	worried
15282	worry
15283	worry about
15284	worry about ...
15285	worry about sb./sth.
15286	worse
15287	worsen
15288	worship
15289	worst
15290	worth
15291	worthwhile
15292	worthy
15293	would
15294	would like
15295	would like to
15296	would rather
15297	would rather ... than ...
15298	Would you like ...?
15299	wouldn't
15300	wound
15301	wounded
15302	wow
15303	Wow!
15304	wrap
15305	wrap up
15306	wrapper
15307	wrapping
15308	wreath
15309	wrench
15310	wrestle
15311	wrestle with something
15312	wrestling
15313	wretched
15314	wrinkle
15315	wrinkled
15316	wrist
15317	Wristies
15318	write
15319	write a letter
15320	write about
15321	write down
15322	write head
15323	write out
15324	write to
15325	writer
15326	writhe
15327	writing
15328	written
15329	wrong
15330	wrote
15331	Wuthering Heights
15332	WWF
15333	WWW
15334	X-ray
15335	yak
15336	yard
15337	yard sale
15338	yawn
15339	yay
15340	yeah
15341	year
15342	year book
15343	yearbook
15344	yearly
15345	year-round
15346	years
15347	yell
15348	yell at
15349	yell bloody murder
15350	yellow
15351	Yellowstone National Park
15352	yes
15353	Yes, please.
15354	Yes? What can I do for you?
15355	yesterday
15356	yet
15357	Yeti
15358	yield
15359	yippee
15360	yoga
15361	yoghurt
15362	yogurt
15363	you
15364	you bet
15365	You had better ...
15366	You'd better ...
15367	you'll
15368	young
15369	younger
15370	youngest
15371	youngster
15372	your
15373	you're
15374	You're joking, aren't you?
15375	you're welcome
15376	You're welcome!
15377	You're welcome.
15378	yours
15379	Yours
15380	yours faithfully
15381	yours sincerely
15382	yourself
15383	yourselves
15384	youth
15385	Youth League
15386	youth worker
15387	youthful
15388	You've got a point there.
15389	yoyo
15390	yuan
15391	yuck
15392	yucky
15393	yuk
15394	Yulan magnolia
15395	yum
15396	yummy
15397	zebra
15398	zebra crossing
15399	zero
15400	zero in on
15401	Zimbabwe
15402	zinc
15403	zip
15404	Zip disk
15405	Zip drive
15406	zipper
15407	Zoe
15408	zone
15409	zongzi
15410	zoo
15411	zookeeper
15412	zoology
15413	zoom
15414	zoom in on