Select * from project..data

--total episodes

Select count(distinct epno) from project..data

--pitches

Select count (distinct brand) from project..data

--pitches converted
Select cast(sum(a.converted_not_converted) as float)/ cast(count(*) as float) from( 
Select amountinvestedlakhs , case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from project..data) a

-- total male
Select sum(male) from project..data
--total females
Select sum(female) from project..data

 --Gender ratio
Select sum(female)/sum(male) from project..data

--total invested amount
Select sum(AmountInvestedlakhs) from project..data

--avg equity taken
Select avg(a.equitytakenp) from
(Select * from project..data where equitytakenP > 0) a

--highest amount invested
Select max(amountinvestedlakhs )from project..data

--highest equity taken by the shark
Select max(equitytakenp) from project..data

--pitches with female contestants
Select sum(a.female_count) from(
Select female, case when female>0 then 1 else 0 end as female_count from project..data) a

--pitches converted having atleast one woman
Select * from project..data

Select sum(female_count) from(
Select case when a.female>0 then 1 else 0 end as female_count ,a.* from(
(Select* from project..data where deal!='No Deal')) a)b

--avg team members in shark tank 
select avg(teammembers) from project..data

--avg amt invested in per deal
Select avg(a.amountinvestedlakhs) amount_invested_per_deal from
(select * from project..data where deal!='No Deal') a

--avg age froup of contestants
Select avgage,count (avgage) cnt from project..data group by avgage order by cnt desc

--location from where most no. of pitches came
Select  location, count(location) cnt from project..data group by location order by cnt desc

--sector from which most pitches came
Select sector, count (sector) cnt from project..data group by sector order by cnt desc

--partner deals
Select partners, count(partners)cnt from project..data where partners!='-' group by partners order by cnt desc



--making the matrix
--total deals in which Ashneer was present
Select 'Ashneer' as keyy,count(ashneeramountinvested) from project..data where ashneeramountinvested is not null
Select 'Ashneer' as keyy,count(ashneeramountinvested) from project..data where ashneeramountinvested is not null AND ashneeramountinvested!=0
Select 'Ashneer' as keyy, SUM(c.ashneeramountinvested), AVG(c.ashneerequitytakenp)
From (Select * from project..data where ashneerequitytakenp!=0 AND ashneerequitytakenp IS NOT NULL) c



select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals_present from project..data where ashneeramountinvested is not null) a
inner join (
Select 'Ashneer' as keyy,count(ashneeramountinvested)total_deals from project..data where ashneeramountinvested is not null AND ashneeramountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Ashneer' as keyy, SUM(c.ashneeramountinvested) total_amount_invested,
AVG(c.ashneerequitytakenp) avg_equity_taken
From (Select * from project..data where ashneerequitytakenp!=0 AND ashneerequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy

-- total deals in which Anupam was present
Select 'Anupam' as keyy,count(anupamamountinvested) from project..data where anupamamountinvested is not null
Select 'Anupam' as keyy,count(anupamamountinvested) from project..data where anupamamountinvested is not null AND anupamamountinvested!=0
Select 'Anupam' as keyy, SUM(c.anupamamountinvested), AVG(c.anupamequitytakenp)
From (Select * from project..data where anupamequitytakenp!=0 AND anupamequitytakenp IS NOT NULL) c


select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Anupam' as keyy,count(anupamamountinvested) total_deals_present from project..data where anupamamountinvested is not null) a
inner join (
Select 'Anupam' as keyy,count(anupamamountinvested)total_deals from project..data where anupamamountinvested is not null AND anupamamountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Anupam' as keyy, SUM(c.anupamamountinvested) total_amount_invested,
AVG(c.anupamequitytakenp) avg_equity_taken
From (Select * from project..data where anupamequitytakenp!=0 AND anupamequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy

-- total deals in which Aman was present

Select 'Aman' as keyy,count(amanamountinvested) from project..data where amanamountinvested is not null
Select 'Aman' as keyy,count(amanamountinvested) from project..data where amanamountinvested is not null AND amanamountinvested!=0
Select 'Aman' as keyy, SUM(c.amanamountinvested), AVG(c.amanequitytakenp)
From (Select * from project..data where amanequitytakenp!=0 AND amanequitytakenp IS NOT NULL) c


select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Aman' as keyy,count(amanamountinvested) total_deals_present from project..data where amanamountinvested is not null) a
inner join (
Select 'Aman' as keyy,count(amanamountinvested)total_deals from project..data where amanamountinvested is not null AND amanamountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Aman' as keyy, SUM(c.amanamountinvested) total_amount_invested,
AVG(c.amanequitytakenp) avg_equity_taken
From (Select * from project..data where amanequitytakenp!=0 AND amanequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy

--total deals in which Namita was presnt

Select 'Namita' as keyy,count(namitaamountinvested) from project..data where namitaamountinvested is not null
Select 'Namita' as keyy,count (namitaamountinvested) from project..data where namitaamountinvested is not null AND namitaamountinvested!=0
Select 'Namita' as keyy, SUM(c.namitaamountinvested), AVG(c.namitaequitytakenp)
From (Select * from project..data where namitaequitytakenp!=0 AND namitaequitytakenp IS NOT NULL) c


select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Namita' as keyy,count(namitaamountinvested) total_deals_present from project..data where namitaamountinvested is not null) a
inner join (
Select 'Namita' as keyy,count(namitaamountinvested)total_deals from project..data where namitaamountinvested is not null AND namitaamountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Namita' as keyy, SUM(c.namitaamountinvested) total_amount_invested,
AVG(c.namitaequitytakenp) avg_equity_taken
From (Select * from project..data where namitaequitytakenp!=0 AND namitaequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy


--total deals in which Vineeta was present
Select 'Vineeta' as keyy,count(vineetaamountinvested) from project..data where vineetaamountinvested is not null
Select 'Vineeta' as keyy,count(vineetaamountinvested) from project..data where vineetaamountinvested is not null AND vineetaamountinvested!=0
Select 'Vineeta' as keyy, SUM(c.vineetaamountinvested), AVG(c.vineetaequitytakenp)
From (Select * from project..data where vineetaequitytakenp!=0 AND vineetaequitytakenp IS NOT NULL) c


select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Vineeta' as keyy,count(vineetaamountinvested) total_deals_present from project..data where vineetaamountinvested is not null) a
inner join (
Select 'Vineeta' as keyy,count(vineetaamountinvested)total_deals from project..data where vineetaamountinvested is not null AND vineetaamountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Vineeta' as keyy, SUM(c.vineetaamountinvested) total_amount_invested,
AVG(c.vineetaequitytakenp) avg_equity_taken
From (Select * from project..data where vineetaequitytakenp!=0 AND vineetaequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy
select c.* from 
(select brand,sector,amountinvestedlakhs,rank() over(partition by sector order by amountinvestedlakhs desc) rnk 

from project..data) c

where c.rnk=1



select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Anupam' as keyy,count(anupamamountinvested) total_deals_present from project..data where anupamamountinvested is not null) a
inner join (
Select 'Anupam' as keyy,count(anupamamountinvested)total_deals from project..data where anupamamountinvested is not null AND anupamamountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Anupam' as keyy, SUM(c.anupamamountinvested) total_amount_invested,
AVG(c.anupamequitytakenp) avg_equity_taken
From (Select * from project..data where anupamequitytakenp!=0 AND anupamequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy

Union

select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals_present from project..data where ashneeramountinvested is not null) a
inner join (
Select 'Ashneer' as keyy,count(ashneeramountinvested)total_deals from project..data where ashneeramountinvested is not null AND ashneeramountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Ashneer' as keyy, SUM(c.ashneeramountinvested) total_amount_invested,
AVG(c.ashneerequitytakenp) avg_equity_taken
From (Select * from project..data where ashneerequitytakenp!=0 AND ashneerequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy
Union

select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Aman' as keyy,count(amanamountinvested) total_deals_present from project..data where amanamountinvested is not null) a
inner join (
Select 'Aman' as keyy,count(amanamountinvested)total_deals from project..data where amanamountinvested is not null AND amanamountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Aman' as keyy, SUM(c.amanamountinvested) total_amount_invested,
AVG(c.amanequitytakenp) avg_equity_taken
From (Select * from project..data where amanequitytakenp!=0 AND amanequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy
 UNION

 select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Namita' as keyy,count(namitaamountinvested) total_deals_present from project..data where namitaamountinvested is not null) a
inner join (
Select 'Namita' as keyy,count(namitaamountinvested)total_deals from project..data where namitaamountinvested is not null AND namitaamountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Namita' as keyy, SUM(c.namitaamountinvested) total_amount_invested,
AVG(c.namitaequitytakenp) avg_equity_taken
From (Select * from project..data where namitaequitytakenp!=0 AND namitaequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy
UNion
select m.keyy, m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from 
(Select a.keyy, a.total_deals_present, b.total_deals from(
Select 'Vineeta' as keyy,count(vineetaamountinvested) total_deals_present from project..data where vineetaamountinvested is not null) a
inner join (
Select 'Vineeta' as keyy,count(vineetaamountinvested)total_deals from project..data where vineetaamountinvested is not null AND vineetaamountinvested!=0)b
on a.keyy=b.keyy) m

inner join

(Select 'Vineeta' as keyy, SUM(c.vineetaamountinvested) total_amount_invested,
AVG(c.vineetaequitytakenp) avg_equity_taken
From (Select * from project..data where vineetaequitytakenp!=0 AND vineetaequitytakenp IS NOT NULL) c) n

on m.keyy=n.keyy
