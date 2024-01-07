-- Run scorers list

SELECT T1.Player, T4.Innings,
CASE
	WHEN T4.Innings - T2.Dismissals IS NULL THEN T4.Innings
    ELSE T4.Innings - T2.Dismissals
END AS Notouts,
T1.Runs, T1.Balls, T1.SR, ROUND((T1.Runs/T2.Dismissals), 2) AS Average,
CASE
	WHEN T3.`6s` IS NULL THEN 0
	ELSE T3.`6s`
END AS 6s, T1.Team
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs, COUNT(ball) AS Balls, ROUND((SUM(runs_off_bat)/COUNT(ball))*100, 2) AS SR, batting_team AS Team
FROM IPL_2023.deliveries
WHERE wides = ''
GROUP BY striker, batting_team
ORDER BY Runs DESC) T1
LEFT JOIN
(SELECT player_dismissed AS Player, COUNT(player_dismissed) AS Dismissals
FROM IPL_2023.deliveries
WHERE player_dismissed != ''
GROUP BY player_dismissed) T2
ON T1.Player = T2.Player
LEFT JOIN
(SELECT striker AS Player, COUNT(runs_off_bat) AS 6s
FROM IPL_2023.deliveries
WHERE runs_off_bat = 6
GROUP BY striker) T3
ON T1.Player = T3.Player
LEFT JOIN
(SELECT striker AS Player, COUNT(DISTINCT(match_id)) AS Innings
FROM IPL_2023.deliveries
GROUP BY striker) T4
ON T1.Player = T4.Player
ORDER BY Runs DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Runs in wins

SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Mumbai Indians')
AND batting_team = 'Mumbai Indians'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Mumbai Indians')
AND batting_team = 'Mumbai Indians'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
UNION
SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Chennai Super Kings')
AND batting_team = 'Chennai Super Kings'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Chennai Super Kings')
AND batting_team = 'Chennai Super Kings'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
UNION
SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Gujarat Titans')
AND batting_team = 'Gujarat Titans'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Gujarat Titans')
AND batting_team = 'Gujarat Titans'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
UNION
SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Lucknow Super Giants')
AND batting_team = 'Lucknow Super Giants'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Lucknow Super Giants')
AND batting_team = 'Lucknow Super Giants'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
UNION
SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Royal Challengers Bangalore')
AND batting_team = 'Royal Challengers Bangalore'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Royal Challengers Bangalore')
AND batting_team = 'Royal Challengers Bangalore'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
UNION
SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Rajasthan Royals')
AND batting_team = 'Rajasthan Royals'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Rajasthan Royals')
AND batting_team = 'Rajasthan Royals'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
UNION
SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Kolkata Knight Riders')
AND batting_team = 'Kolkata Knight Riders'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Kolkata Knight Riders')
AND batting_team = 'Kolkata Knight Riders'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
UNION
SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Punjab Kings')
AND batting_team = 'Punjab Kings'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Punjab Kings')
AND batting_team = 'Punjab Kings'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
UNION
SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Sunrisers Hyderabad')
AND batting_team = 'Sunrisers Hyderabad'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Sunrisers Hyderabad')
AND batting_team = 'Sunrisers Hyderabad'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
UNION
SELECT T1.Player, T1.Runs, T2.Balls
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Delhi Capitals')
AND batting_team = 'Delhi Capitals'
GROUP BY striker) T1
JOIN
(SELECT striker AS Player, COUNT(ball) AS Balls
FROM IPL_2023.deliveries
WHERE match_id IN (SELECT match_id
					FROM IPL_2023.match_data
                    WHERE winner = 'Delhi Capitals')
AND batting_team = 'Delhi Capitals'
AND wides = '' AND noballs = ''
GROUP BY striker) T2
ON T1.Player = T2.Player
ORDER BY Runs DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Runs Breakdown

SELECT SUM(runs_off_bat) AS Runs_Off_Bat, SUM(wides) AS Runs_Off_Wides, SUM(noballs) AS Runs_Off_Noballs, SUM(byes) AS Runs_Off_Byes, SUM(legbyes) AS Runs_Off_Legbyes, SUM(extras) AS Total_Extras, SUM(runs_off_bat) + SUM(extras) AS Total_Runs
FROM IPL_2023.deliveries;
---------------------------------------------------------------------------------------------------------------------------------------------

-- Dismissals Breakdown

SELECT COUNT(wicket_type) AS Total_Dismissals, (SELECT COUNT(*) FROM IPL_2023.deliveries WHERE wicket_type = 'bowled') AS Bowled,
(SELECT COUNT(*) FROM IPL_2023.deliveries WHERE wicket_type = 'lbw') AS LBW,
(SELECT COUNT(*) FROM IPL_2023.deliveries WHERE wicket_type = 'stumped') AS Stumping,
(SELECT COUNT(*) FROM IPL_2023.deliveries WHERE wicket_type = 'caught') AS Caught,
(SELECT COUNT(*) FROM IPL_2023.deliveries WHERE wicket_type = 'caught and bowled') AS Caught_and_Bowl,
(SELECT COUNT(*) FROM IPL_2023.deliveries WHERE wicket_type = 'run out') AS Run_Out,
(SELECT COUNT(*) FROM IPL_2023.deliveries WHERE wicket_type = 'hit wicket') AS Hit_Wicket,
(SELECT COUNT(*) FROM IPL_2023.deliveries WHERE wicket_type = 'retired out') AS Retired_Out,
(SELECT COUNT(*) FROM IPL_2023.deliveries WHERE wicket_type = 'retired hurt') AS Retired_Hurt
FROM IPL_2023.deliveries
WHERE wicket_type != '';
---------------------------------------------------------------------------------------------------------------------------------------------

-- Wickets Breakdown by Type

SELECT T1.Bowler,
CASE WHEN T2.Bowled IS NULL THEN 0 ELSE T2.Bowled END AS Bowled,
CASE WHEN T3.LBW IS NULL THEN 0 ELSE T3.LBW END AS LBW,
CASE WHEN T4.Caught IS NULL THEN 0 ELSE T4.Caught END AS Caught,
CASE WHEN T5.Caught_and_Bowl IS NULL THEN 0 ELSE T5.Caught_and_Bowl END AS Caught_and_Bowl,
CASE WHEN T6.Stumping IS NULL THEN 0 ELSE T6.Stumping END AS Stumping,
CASE WHEN T7.Hit_Wicket IS NULL THEN 0 ELSE T7.Hit_Wicket END AS Hit_Wicket,
T1.Total_Wickets
FROM (SELECT bowler AS Bowler, COUNT(wicket_type) AS Total_Wickets
FROM IPL_2023.deliveries
WHERE wicket_type NOT IN ('', 'run out', 'retired out', 'retired hurt')
GROUP BY bowler) T1
LEFT JOIN
(SELECT bowler, COUNT(wicket_type) AS Bowled
FROM IPL_2023.deliveries
WHERE wicket_type = 'bowled'
GROUP BY bowler) T2
ON T1.Bowler = T2.bowler
LEFT JOIN
(SELECT bowler, COUNT(wicket_type) AS LBW
FROM IPL_2023.deliveries
WHERE wicket_type = 'lbw'
GROUP BY bowler) T3
ON T1.Bowler = T3.bowler
LEFT JOIN
(SELECT bowler, COUNT(wicket_type) AS Caught
FROM IPL_2023.deliveries
WHERE wicket_type = 'caught'
GROUP BY bowler) T4
ON T1.Bowler = T4.bowler
LEFT JOIN
(SELECT bowler, COUNT(wicket_type) AS Caught_and_Bowl
FROM IPL_2023.deliveries
WHERE wicket_type = 'caught and bowled'
GROUP BY bowler) T5
ON T1.Bowler = T5.bowler
LEFT JOIN
(SELECT bowler, COUNT(wicket_type) AS Stumping
FROM IPL_2023.deliveries
WHERE wicket_type = 'stumped'
GROUP BY bowler) T6
ON T1.Bowler = T6.bowler
LEFT JOIN
(SELECT bowler, COUNT(wicket_type) AS Hit_Wicket
FROM IPL_2023.deliveries
WHERE wicket_type = 'hit wicket'
GROUP BY bowler) T7
ON T1.Bowler = T7.bowler
ORDER BY T1.Total_Wickets DESC;
------------------------------------------------------------------------------------------------------------------------------------------------

-- teamwise_bowling

SELECT T1.Team, T1.Innings, T2.Wickets, T3.Overs, ROUND((T1.`Runs Given`/T3.Balls)*6, 2) AS Economy, ROUND(T1.`Runs Given`/T2.Wickets, 2) AS Average, ROUND(T3.Balls/T2.Wickets, 2) AS 'Strike Rate'
FROM (SELECT bowling_team AS Team, COUNT(DISTINCT match_id) AS Innings, SUM(runs_off_bat) + SUM(extras) AS 'Runs Given'
FROM IPL_2023.deliveries
GROUP BY bowling_team) T1
JOIN
(SELECT bowling_team AS Team, COUNT(*) AS Wickets
FROM IPL_2023.deliveries
WHERE wicket_type NOT IN ('', 'retired hurt')
GROUP BY bowling_team) T2
ON T1.Team = T2.Team
JOIN
(SELECT bowling_team AS Team, COUNT(ball) AS Balls, ROUND(((FLOOR(COUNT(ball)/6)) + ((COUNT(ball)%6)/10)), 1) AS Overs
FROM IPL_2023.deliveries
WHERE wides = '' AND noballs = ''
GROUP BY bowling_team) T3
ON T1.Team = T3.Team
ORDER BY T2.Wickets DESC;
------------------------------------------------------------------------------------------------------------------------------------------------

-- Phase 1 Batting (1-6 Overs)

SELECT T1.Player, T4.Innings, T2.Dismissals,
T1.Runs, T1.Balls, T1.SR, ROUND((T1.Runs/T2.Dismissals), 2) AS Average,
CASE
	WHEN T3.`6s` IS NULL THEN 0
	ELSE T3.`6s`
END AS 6s, T1.Team
FROM (SELECT striker AS Player, SUM(runs_off_bat) AS Runs, COUNT(ball) AS Balls, ROUND((SUM(runs_off_bat)/COUNT(ball))*100, 2) AS SR, batting_team AS Team
FROM IPL_2023.deliveries
WHERE wides = '' AND SUBSTR(ball, 1, 2) IN ('0.', '1.', '2.', '3.', '4.', '5.')
GROUP BY striker, batting_team
ORDER BY Runs DESC) T1
LEFT JOIN
(SELECT player_dismissed AS Player, COUNT(player_dismissed) AS Dismissals
FROM IPL_2023.deliveries
WHERE player_dismissed != '' AND SUBSTR(ball, 1, 2) IN ('0.', '1.', '2.', '3.', '4.', '5.')
GROUP BY player_dismissed) T2
ON T1.Player = T2.Player
LEFT JOIN
(SELECT striker AS Player, COUNT(runs_off_bat) AS 6s
FROM IPL_2023.deliveries
WHERE runs_off_bat = 6 AND SUBSTR(ball, 1, 2) IN ('0.', '1.', '2.', '3.', '4.', '5.')
GROUP BY striker) T3
ON T1.Player = T3.Player
LEFT JOIN
(SELECT striker AS Player, COUNT(DISTINCT(match_id)) AS Innings
FROM IPL_2023.deliveries
WHERE SUBSTR(ball, 1, 2) IN ('0.', '1.', '2.', '3.', '4.', '5.')
GROUP BY striker) T4
ON T1.Player = T4.Player
ORDER BY Runs DESC;
------------------------------------------------------------------------------------------------------------------------------------------------

-- Everything related to match data

SELECT winner AS Team, COUNT(*) AS Wins
FROM IPL_2023.match_data
WHERE match_type = 'Group' AND winner != 'No Result'
GROUP BY winner
ORDER BY Wins DESC, Team;

-- Match Summary

create temporary table match_summary as (
SELECT
	CONCAT(home_team, ' vs ', away_team) AS 'Match',
	venue AS Venue,
    CONCAT(toss_winner, ' won the toss and decided to ', toss_decision) AS Toss_Result,
    CASE
		WHEN winner_runs = '' THEN CONCAT(winner, ' won by ', winner_wickets, ' wickets')
        WHEN winner_wickets = '' THEN CONCAT(winner, ' won by ', winner_runs, ' runs')
	END AS Match_Result
FROM IPL_2023.match_data);
------------------------------------------------------------------------------------------------------------------------------------------------