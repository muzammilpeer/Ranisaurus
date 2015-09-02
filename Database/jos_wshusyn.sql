-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 02, 2015 at 06:51 AM
-- Server version: 5.5.42-37.1-log
-- PHP Version: 5.4.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ranisaur_jml1`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_wshusyn`
--

DROP TABLE IF EXISTS `jos_wshusyn`;
CREATE TABLE IF NOT EXISTS `jos_wshusyn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `tagline` varchar(2048) NOT NULL DEFAULT 'tagline',
  `howTo` varchar(4096) NOT NULL DEFAULT 'none',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=411 ;

--
-- Dumping data for table `jos_wshusyn`
--

INSERT INTO `jos_wshusyn` (`id`, `category`, `tagline`, `howTo`, `published`) VALUES
(18, 2, '"We will not mortgage our future by not investing in today"', 'If you need to convince your audience to make an investment during tough times.', 1),
(19, 2, '"If you don''t like something, change it. If you can''t change it, change your attitude."', 'If someone complains about a specific problem or process.', 1),
(20, 2, '"As a leader the most important action is eliminating risk"', 'If you are presented with a high risk activity, transaction, or project.', 1),
(21, 2, '"Bad news doesn''t become better with time"', 'If you are presented with bad news', 1),
(22, 2, '"Remember to Block and Tackle"', 'Reminding subordinates to focus on day-to-day business and long term projects.', 1),
(23, 2, '"You are either right, or happy"', 'Even when times are good, you need to be aware of hidden risk', 1),
(28, 3, '"Is this project risk weighted."', 'Whenever a project is presented, you can ask to see if risk was considered in the business case.', 1),
(27, 5, '"I cascade the questions and if the answer is hollow, I will go for the jugular"', 'To set the tone in a meeting, you advise that you will be the one asking the questions, and if the answers are hollow, you will go for the kill (attacking the jugular vein)', 1),
(34, 3, '"What''s worst? A false positive or a false negative?"', 'If a problem is presented that proves not to be a problem after further investigation.', 1),
(33, 3, '"How do we maximize 1+1 to equal more than 2?"', 'When you are looking to get more out of a team or an individual.', 1),
(35, 3, '"What are the key factors of success?"', 'To identify the elements that make a project or a task successful', 1),
(36, 3, '"How can we benefit from the hidden  benefit?"', 'To get someone to look deeper, and see what other elements can bring value.', 1),
(37, 4, '"This is nauseating bureaucratic Inertia"', 'If something is not moving fast enough due to internal processing time.', 1),
(38, 4, '"If those improvements are not measurable, what good are they?"', 'If you are being told that improvements have been made with no evidence of these improvements.', 1),
(39, 4, '"Has any gray matter been applied in this logic?"', 'If no thought has been applied to what is being presented.', 1),
(40, 4, '"You''re not here for your looks, obviously not, you are here to make a commitment"', 'To tell someone to make a commitment to deliver results.', 1),
(41, 4, '"Was the power of "Group Think" used here, or is this just you?"', 'Asking if anyone has been consulted prior to submitting information.', 1),
(42, 5, '"He is my glasses, I need him to see"', 'To bring someone to a meeting where they have not been invited.', 1),
(43, 5, '"I had a Eureka moment"', 'If you find/discover something new or exciting.', 1),
(44, 2, '"Let''s pull on that thread"', 'Asking someone to continue a trail of thought, or explore something further.', 1),
(45, 7, '"All I can say is this is a test you don''t want to fail"', 'Making sure the other party feels accountable for the results.', 1),
(46, 7, '"I need you to realize that there are expectations"', 'Their are many people depending on the results.', 1),
(47, 7, '"I need to challenge your comfort level"', 'Pushing an individual or a group of people to do somethings differently.', 1),
(49, 7, '"I want you all to know, there are no golden parachutes"', 'No one is getting a free pass, you need to succeed to progress to the next level.', 1),
(50, 6, '"We can line up the excuses but in the end we need to get this done"', 'When two parties are arguing on who is to blame, but you still need to see results.', 1),
(51, 6, '"We can throw the ball back & forth but at this point it is what it is"', 'When two parties are playing the blame game.', 1),
(52, 6, '"It is too late, at this point we are pregnant"', 'When it is too late to argue about who is to blame.', 1),
(53, 6, '"We are just clapping into each other here"', 'To stop two parties that are arguing.', 1),
(54, 8, '"I said my part, now you need to make it happen"', 'When you only want results and don''t want to hear the details.', 1),
(55, 8, '"If I don''t push the envelope then you will sit there dumb, fat & happy"', 'If someone is resisting to do more.', 1),
(56, 8, '"Tell us what you want & we will say No!"', 'If you don''t want to change the plan and stay the course', 1),
(57, 8, '"Do as I say, and If you still get no joy, see me in my office"', 'When you just want someone to do it your way.', 1),
(58, 8, '"I will be farming this out for you to harvest the actions"', 'My job is to tell you what to do, your job is to get it done.', 1),
(59, 7, '"If you are ready put pen to paper"', 'Asking someone to make a formal commitment.', 1),
(60, 8, '"I don''t want to push you into the tissue box"', 'I need this to be done, but i don''t want you to cry in the process.', 1),
(61, 8, '"At this point, effort alone doesn''t cut it"', 'When you need to see results.', 1),
(62, 9, '"Either fix the process, or deliver results by brute force"', 'If you refuse to accept poor results due to a bad process.', 1),
(63, 9, '"There is no magic here, this is all about planning"', 'Telling people that good planning delivers results.', 1),
(64, 9, '"It''s not going to be easy but we like it that way"', 'Leading in tough times, there is no easy way out.', 1),
(65, 9, '"You need to lead them to water. They may not drink, but you have to get them there"', 'When you need someone to deliver results but also make them realize that compliance is up to the user.', 1),
(66, 9, '"We have a long road ahead, we can''t stumble on details"', 'To make the audience understand that their is more work to be done and we cannot start arguing on every detail.', 1),
(67, 10, '"Even in these times, we need to continue to hire talent & not just warm bodies"', 'Hiring talent is necessary in good times and more so in bad times.', 1),
(68, 10, '"We can only proceed when we find the common path forward"', 'We need to agree to move forward.', 1),
(69, 23, '"We need to have this at arms length before we rain it in for more visibility"', 'I need more time to get it done.  I  need to step away and re-approach the problem again.', 1),
(70, 11, '"If this information is giving you a heartburn, then you might want to leave"', 'I bad news, and you need to hear it.', 1),
(71, 11, '"You need to break some eggs to make an omelet here"', 'We need to make tough changes if we want to deliver results.', 1),
(72, 11, '"I wish this was a duck in water story, but it''s not"', 'If you are bringing bad news.', 1),
(73, 12, '"Let me break that down so its simpler for you"', 'If you are annoyed by the same question being asked in different ways.', 1),
(74, 13, '"Lets make this slide executive friendly before we abandon it"', 'If you are being told that a slide is to busy with information/content, but you still want to present it!', 1),
(75, 13, '"This slide is not intended for beauty, as it is more for content"', 'Basically you had no time to make your slide "pretty" but all the information is there.', 1),
(76, 13, '"I think this slide can read better, if we change it"', 'If you are told to remove a slide but you still want to present it.', 1),
(77, 14, '"This looks like window dressing if you ask me"', 'If you are presented with bad new or poor results in a nice story or a "kool" slide.', 1),
(78, 14, '"This is so sugar coated my teeth are hurting"', 'If someone is trying to sell you in on a bad idea.', 1),
(79, 14, '"This looks like the motherhood & apple pie"', 'Someone presents a second solution that looks similar to the first solution.  Basically no one is presenting a creative solution.', 1),
(80, 14, '"It looks like you''re pushing a rope"', 'When a lot of work is being done but with little to no results.', 1),
(81, 14, '"I''m gonna disagree with you on a positive stand point"', 'You want to disagree with that is being presented without offending the presenter, but you disagree all the same.', 1),
(82, 15, '"Might as well submit our badges now & walk away"', 'When you want more to be done and will not accept less.', 1),
(83, 15, '"The "Rambo" approach does not address the root cause of the problem!"', 'If a problem gets resolved due to one persons heroic effort, but the core of the problem has not been addressed.', 1),
(84, 15, '"Let''s take a deeper look before we claim victory"', 'If you are being told that a problem has been resolved, but you are still skeptical.', 1),
(85, 15, '"This doesn''t sound glowingly confident"', 'If someone is committing to do something in hesitation.', 1),
(86, 15, '"Are these results mood dependent?"', 'If someone cannot explain why his/her results can go up or down.', 1),
(87, 16, '"I don''t have anything off the top of my head that I can speak to now"', 'You are asked a question, but you have no idea whats going on.', 1),
(88, 16, '"We gave it a good spin of the wheel, but we need more time before we can answer that"', 'You are being asked a question but you have nothing to say and want to buy time.', 1),
(89, 16, '"We have everything there, but the magic recipe is not here yet"', 'You have exhausted all resources but the solution has not yet been found.', 1),
(90, 16, '"Pardon me for being simple on this matter, but i will table it down"', 'You are asked a question, or presented a problem, but you want to dodge any possibility of having to give an answer.', 1),
(91, 16, '"I''m not sure I will have to confirm this and come back to you"', 'Someone if asking for more detail but you only know the high level numbers.', 1),
(92, 16, '"It''s been illustrated but not yet quantified"', 'You are being asked to present your information in numbers, but you have no idea or time to do it.', 1),
(93, 18, '"This program started on the left foot"', 'There is nothing more you can do.', 1),
(94, 18, '"I feel like the plan is to sell used refrigerators to an Eskimo"', 'You are being asked to do something that doesn''t make sense.', 1),
(95, 18, '"This solution is as good as tits on a bull"', 'You disagree with how something is being done.', 1),
(96, 19, '"What is the future margin expansion plan & how do we offset the impact of foreign exchange and inflation?"', 'Be ready for this one, every Executive will use this at one point or another.  To answer this question I suggest you reference the "Exit lines to any question" section.', 1),
(97, 19, '"We will not try to understand the reasons behind the "Why"!"', 'You don''t have time to dig in the details, lets move on! - Don''t try this with your Boss', 1),
(98, 20, '"I need you to carry this like the Olympic Torch"', 'You need someone to stick around until it is done.', 1),
(99, 20, '"You just signed yourself up for a whole boat load of work"', 'Telling someone that they will be getting a lot of work to do.', 1),
(100, 20, '"You will need to stay here until the wolf is out of the hen house"', 'Telling someone they will not be leaving until the problem is resolved.', 1),
(101, 20, '"You will be waiting at the bus stop alone tonight"', 'Telling someone they will be the last one to leave the office.', 1),
(102, 21, '"We need to lower the waterline & address the real issues"', 'Questioning if the true root cause is being addressed', 1),
(103, 21, '"Is this line of sight inline with our 5 year strategy?"', 'This question is best asked in the presence of Executives and a large audience.', 1),
(104, 21, '"We need to be in the driver seat when this comes"', 'Telling people to be ready for the road ahead.', 1),
(105, 21, '"This is what the elephant in the rain was trying to say"', 'To pretend that you had come to this conclusion first.', 1),
(106, 21, '"It is the chocolate version of the tool"', 'If you see a new feature, or if you added a feature to something given to you.', 1),
(117, 25, '"We can''t let this string into next week, here is what I want"', 'If you want to cut it short.', 1),
(116, 12, '"Again for me to be clear"', 'When you are asked something again.', 1),
(118, 25, '"I hate to cut it short, but I don''t think I can add more value here"', 'If you want to leave a meeting.', 1),
(119, 25, '"I have a hard cut-off at..."', 'If you must leave at a certain time.', 1),
(120, 26, '"We don''t have to skate backwards on this one"', 'When you want to hold your ground and don''t think you should take a defensive position.', 1),
(121, 26, '"We need to make a call here, we can''t be half pregnant on this topic"', 'When a decision needs to be made.', 1),
(122, 26, '"If you have any burning questions I can take them now, otherwise we will continue"', 'If you are presenting and interrupted by a question.', 1),
(123, 27, '"All in all, we made as much lemonade from these lemons as possible"', 'If you cannot do more than what has already been done.', 1),
(124, 27, '"In realty, shit happens"', 'When your back is against the wall.', 1),
(125, 27, '"It''s not a lack of will, the needle appears to be broken"', 'When everything is being done but results do not reflect that.', 1),
(126, 28, '"I want to make sure we position this correctly"', 'You want to set it up to succeed.', 1),
(127, 28, '"I would like to dial down the expectations"', 'If you would like to bring expectations back to a reasonable level.', 1),
(128, 28, '"These colors don''t work well on executive pallets"', 'If you would like to convince someone to change the colour-scheme on their slide.', 1),
(129, 28, '"The grey zone is where I am most comfortable"', 'To indicate that you are comfortable working in an unconventional/undefined position.', 1),
(160, 12, '"I will not be pressured to make a call regardless of the urgency"', 'If you don''t have a full understanding of the situation and being pressured to make a decision', 1),
(161, 9, '"It is not the single effort that stands out for me, its the totality of the effort in the body of the work"', 'When you are looking to inspire a team effort, and asking the "eager beaver" to play in "team mode"', 1),
(250, 7, '"You can''t lead from behind"', 'As a leader you need to lead by example and be on the front line', 1),
(163, 23, '"It was taken over at mid-frame"', 'If you had to pick up a project or a task that still is not delivering results.', 1),
(164, 23, '"Right now, this is what we are using as a barometer"', 'If you are being asked to measure results differently.', 1),
(165, 23, '"This is tribal knowledge, you have to be there to know it"', 'If you are being asked "how come you didn''t know this earlier"', 1),
(166, 24, '"I only look at the numbers, and I do that because you report them to me"', 'When you want to see results reflected on your metrics', 1),
(167, 24, '"Managers are not there to make & justify excuses, they are there to deliver results"', 'You don''t want to listen or accept any excuses.', 1),
(168, 24, '"We need to step-up to make a home run"', 'To push everyone to do more', 1),
(169, 24, '"There is no buffet to choose from, we need to execute"', 'When there are limited options on the table.', 1),
(170, 24, '"12 days! that''s pretty sporty.  I need it now"', 'When you want to see immediate results.', 1),
(171, 10, '"If we get too automated, then life will not match the plan"', 'When you want to keep things the way they are.', 1),
(172, 10, '"We need to continue moving the needle if we want more results"', 'We need to do more, to see more results.', 1),
(176, 14, '"I think you are dipping your pen in company ink one too many times"', 'Telling someone that they are taking advantage of company assets.', 1),
(191, 2, '"You have to raise your fists before you can fight!"', 'Preparing for debate', 1),
(192, 15, '"You can''t suck and blow at the same time!"', 'You need to focus on one thing or the other.', 1),
(249, 2, '"Its not the problems that break us, its the solutions that can''t be reached"', 'We cant let disagreements get in the way of resolving problems.', 1),
(234, 18, '"It''s your 500lbs gorilla, now you make it go away"', 'Telling someone to take care of their own problem', 1),
(233, 16, '"You need to know when to milk the cow, and when to let is graze"', 'If you want to buy time, and convince your audience that "this" opportunity is better had later.', 1),
(232, 23, '"We needed quit and re-align"', 'If you are asked about a change in plan', 1),
(248, 7, '"Its not the speed in which you can get it done, its the speed in which it can be resolved that concerns me"', 'You think the problem is bigger than the solution being presented', 1),
(253, 16, '"The solution depends on how you see the Rubik''s cube"', 'There are different solution to this problem and more time is needed to resolve it', 1),
(254, 3, '"We need to know the difference between inherent variability and self-induced ones"', 'Inherent variables are natural variables.  Self-induced variables are the ones that can be addressed', 1),
(255, 4, '"I need to impress upon you a sense of urgency"', 'When you need someone to make your request a priority', 1),
(256, 2, '"We need critical mass to move forward"', 'There needs to be momentum to continue moving.', 1),
(257, 18, '"The era of being grandfathered in has ended"', 'There will be a new way of doing things', 1),
(258, 9, '"You put your skin in the game & we will put ours"', 'Asking another party to commit', 1),
(259, 21, '"How do we change this to be business case positive"', 'How do we turn a bad situation into a good one', 1),
(260, 9, '"When odds are one in a million, be that one"', 'To convince your audience that they are unique.', 1),
(261, 20, '"I need u to stay behind and shoulder that load"', 'If you want to tell someone to take on a task', 1),
(262, 21, '"Tell me, how do we get the cream without going for the cow?"', 'How can we make a profit without having to pay the cost', 1),
(263, 28, '"Is this canned information or do we have to mine for it?"', 'Do we have the information available or is work required to extract it', 1),
(264, 20, '"It seems like you will be having dinner here tonight"', 'Telling someone that they are going to work late', 1),
(265, 14, '"If you ask me, this looks like pilot error"', 'Someone F@$ked-up', 1),
(270, 4, '"When there is nothing, shit shines!"', 'You are not impressed with that is being presented', 1),
(271, 24, '"Is this the "Best-of-the-Best", or the Best of whats available"', 'To challenge do better', 1),
(273, 5, '"I''m not looking to invite more tasks but I believe this one is important"', 'To tell someone that they are going to do something for you', 1),
(274, 18, '"It feels like drinking out of a fire hose"', 'When you are overwhelmed the the volume of work coming your way', 1),
(275, 9, '"Anything less than perfect is not good enough"', 'If you only expect the best', 1),
(276, 23, '"It''s a work in progress, at least now we have a platform to work off"', 'If you have not progressed as far as expected', 1),
(280, 2, '"Never stop looking up"', 'To inspire and lead a team', 1),
(281, 4, '"Being as executive is not about closed offices and reserved parking spots, its about long hours and hard work"', 'When you need your executive team to do more', 1),
(282, 26, '"Sales presentations are always seductive"', 'Telling people not be get overly excited after seeing a sales pitch', 1),
(283, 12, '"Next question"', 'When you want to move on', 1),
(285, 21, '"Is that an issue or an interesting wrinkle?"', 'Do we have a big problem or a small one', 1),
(290, 28, '"this is the x-factor that i bring"', 'To highlight your abilities', 1),
(300, 8, '"We have come too far now to be lying down"', 'When you want people to go even further...', 1),
(292, 27, '"If they think you''re crazy, you can slip through the cracks"', 'be creative', 1),
(293, 15, '"This is a standard stock response"', 'When someone responds to your question with a generic answer', 1),
(294, 28, '"He is one of their brighter lights"', 'To say that someone is very smart', 1),
(296, 18, '"You must be special to somebody"', 'Someone out there must like you, but i don''t', 1),
(299, 24, '"Once signed for, this budget can''t breath"', 'Once the budget it set, there is no flexibility to increase it', 1),
(301, 2, '"Honesty is an expensive gift, don''t expect it from cheap people"', 'It is rare to find honest people', 1),
(302, 10, '"It''s not over when you fail, it''s over when you quit..."', 'Quitting is for losers', 1),
(303, 7, '"I need you to quantify that for me"', 'When you want someone to be more specific', 1),
(304, 7, '"When we are talking about assets and liabilities, everything should be tangible"', 'If you want someone to be more specific', 1),
(306, 18, '"If you pay peanuts you get monkeys"', 'You get what you pay for', 1),
(308, 15, '"I classify this in the genre of crap for tourists to buy"', 'If you don''t see anything special in what is being presented', 1),
(312, 3, '"How do we make this easier for them to on-board"', 'How can we make this more appealing', 1),
(310, 28, '"My money loves me too much, but if i leave it alone for too long it might not remember who i am"', 'If the return on investment is too far in the future for your comfort level', 1),
(311, 25, '"We are not beta testers"', 'Telling someone that it has to work', 1),
(314, 20, '"You will be the one left holding the bag"', 'You are going to get fucked', 1),
(315, 16, '"For this situation there are no yes or no answers"', 'It is more complicated than it seems', 1),
(317, 9, '"When our Rome is gone, our ruins will remain"', 'We might not win, but they will feel our presence', 1),
(318, 28, '"Loose lips can sink ships"', 'When you want to tell someone to keep information to themselves', 1),
(319, 28, '"I need you to float that idea"', 'If you want someone else to present an idea', 1),
(320, 14, '"The rumours are stronger than the facts here"', 'Perception can distort the facts', 1),
(321, 24, '"Now its time to put the puck in the net"', 'When you want results', 1),
(323, 15, '"We are not looking to become ambulance chasers"', 'We dont want to feed on disaster', 1),
(325, 9, '"I need you to handle this one like a new born baby"', 'If you want to tell someone to be gentle in how they handle a matter', 1),
(326, 15, '"I don''t see any vision in that decision"', 'If you disagree with someones decision', 1),
(327, 4, '"We cannot grow oranges on an apple tree"', 'When someone is expecting the impossible', 1),
(328, 21, '"We need to find the dark horse in the race"', 'We need to be able distinguish between the winners and the losers', 1),
(337, 28, '"You cant start bleeding in a shark tank"', 'When you want someone to keep it together', 1),
(332, 26, '"Your immune system demand that you get sick, so you can get better"', 'Trying to encourage someone who is down', 1),
(333, 20, '"I need you to carry this like a new born baby"', 'If you want someone to micro manage something', 1),
(334, 19, '"They are amongst us now!"', 'We need to be able to identify the odd balls', 1),
(338, 9, '"I need everyone to understand that this is a hard deadline"', 'When there is an objective that needs to be met', 1),
(339, 13, '"We can only force so much simplicity"', 'Some things are not that simple to explain', 1),
(341, 7, '"I can get this job done better on Kijiji"', 'If your not happy with the quality of the work presented', 1),
(343, 15, '"Are we being sold apples on a tree here?"', 'If something sounds fishy', 1),
(344, 23, '"I don''t want to wear out the carpet"', 'To tell someone that you don''t want to overstay your welcome / you need to go', 1),
(345, 2, '"It is our light not our darkness that most frightens us"', 'Our ability is greater than our imagination', 1),
(346, 19, '"We are all born free, it is our perceptions that imprison us"', 'Freedom is a state of mind.', 1),
(347, 10, '"How do we "white" this so it doesn''t sound so negative"', 'How do we make it look better', 1),
(348, 16, '"The only thing we can do is play our cards differently going forward"', 'When you are caught in a bad situation that is not reversible.', 1),
(349, 4, '"I suggest you do what i am telling you or else the next few things are going to be non-consensual"', 'Telling someone to do it your way', 1),
(351, 2, '"There are two types of people in the World, those who create paths and those who follow them"', 'Convincing an individual or group of people to take a risk in life.', 1),
(352, 18, '"They feel like the doctor is here"', 'If you feel that people are always waiting for your opinion before doing anything', 1),
(357, 4, '"You drank the Kool-Aid"', 'To say that someone is on the other team, or has changed their point of view', 1),
(355, 25, '"I need you to group those words on an email"', 'If you have no time to listen and want someone to send you an email.', 1),
(358, 14, '"Who gave you the Kool-Aid"', 'Telling someone that they have been played', 1),
(359, 14, '"Why are you dressed up like a lure?"', 'When someone is trying to attract attention', 1),
(360, 18, '"And so it goes..."', 'Shit happens / That''s the way it is.', 1),
(361, 8, '"Keep on keeping on!"', 'Finish the race / Fight through all the adversity', 1),
(365, 26, '"They must be sending you to find bigfoot"', 'To tell someone that they are getting the run around', 1),
(367, 11, '"The bad guys are always there before the cops"', 'Shit happens', 1),
(372, 4, '"You can''t hand off your demons to me!  They''re your demons, and only you can scare them away..."', 'When you want to tell someone to address their own issues.', 1),
(373, 25, '"He''s coming down like last week''s train!"', 'When someone if charging-in like a bull in a China shop.', 1),
(374, 28, '"He''s on high street"', 'When you want to say that someone is on a path for a promotion', 1),
(381, 11, '"There is only one hair, in the soup"', 'There is one problem', 1),
(382, 2, '"There is oil for every lock"', 'Every problem has a solution', 1),
(392, 28, '"Every Kitten becomes a cat!"', 'Be aware of those that are nice...', 1),
(397, 15, '"You are trying to put the tooth-paste back in the tube"', 'The mistake has happened and cleaning it us will be messy.', 1),
(395, 2, '"You can teach people to count, but you can''t teach them what counts"', 'To say that not everyone has common sense..', 1),
(399, 8, '"I need this yesterday!"', 'If you want the work to be done ASAP.', 0),
(401, 16, '"The numbers may not be accurate, but they are directional"', 'If challenged on the accuracy of your numbers, remind them that the trend is your friend...', 1),
(402, 7, '"You own the decisions you make"', 'To force accountability if someone is skating...', 1),
(403, 0, 'What the fuck', 'The fridge', 0),
(404, 0, 'Vgfg', 'Iujgdsgn', 0),
(405, 0, 'Testing new tagline. Hussain', 'Test. ', 0),
(406, 0, 'testing adding tagline	', 'test', 0),
(407, 0, 'test', 'test', 0),
(408, 0, 'test', 'test', 0),
(409, 0, 'test', 'test', 0),
(410, 0, 'test', 'test', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
