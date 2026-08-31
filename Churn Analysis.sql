CREATE DATABASE customer_churn_analysis;USE customer_churn_analysis;
CREATE TABLE customer_churn (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(40),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5),
    TenureGroup VARCHAR(20),
    ChargeGroup VARCHAR(30),
    RiskFactorCount INT,
    RiskSegment VARCHAR(20));
    
    Show tables;
    desc customer_churn;
select count(*) total_customer from customer_churn;   
select * from customer_churn limit 5;
select sum(record_count - 1) as duplicate_rows
from (select customerID, count(*) as record_count from customer_churn
group by customerID having count(*) > 1) duplicates;

## Overall customer
select count(*) as total_customers, 
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
sum(case when churn = 'no' then 1 else 0 end) as retained_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),2) churn_rate
from customer_churn;

## Churn by contract
select contract, count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),2)churn_rate
from customer_churn group by contract order by churn_rate desc;


## Churn by tenure group
select tenuregroup, count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),2)churn_rate
from customer_churn group by tenuregroup order by churn_rate desc;


## Churn by payment method
select paymentmethod, count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),2)churn_rate
from customer_churn group by paymentmethod order by churn_rate desc;


## Churn by internet service
select internetservice,count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),2) as churn_rate
from customer_churn group by internetservice order by churn_rate desc;


## Customer segment
select contract,paymentmethod,count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),2)churn_rate
from customer_churn group by contract, paymentmethod having count(*) >= 100 order by churn_rate desc;


## High-risk customer profile
select count(*) as high_risk_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),2)churn_rate
from customer_churn where contract = 'Month-to-month' and tenuregroup = '0-12 Months'
and paymentmethod = 'Electronic check' and internetservice = 'Fiber optic';

##Customer segmrnt rank by churn
with segment_analysis as (
    select
        contract,
        paymentmethod,
        count(*) as total_customers,
        sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
        round(
            sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),
            2
        ) as churn_rate
    from customer_churn
    group by contract, paymentmethod
)
select
    contract,
    paymentmethod,
    total_customers,
    churned_customers,
    churn_rate
from segment_analysis
where total_customers >= 100
order by churn_rate desc;


## Rank segment
with segment_analysis as (
    select
        contract,
        paymentmethod,
        count(*) as total_customers,
        sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
        round(
            sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),
            2
        ) as churn_rate
    from customer_churn
    group by contract, paymentmethod
)
select
    contract,
    paymentmethod,
    total_customers,
    churned_customers,
    churn_rate,
    rank() over (order by churn_rate desc) as churn_rank
from segment_analysis
where total_customers >= 100
order by churn_rank;


## Most actionable high risk segmnents
with segment_analysis as (
    select
        contract,
        paymentmethod,
        count(*) as total_customers,
        sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
        round(
            sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),
            2
        ) as churn_rate
    from customer_churn
    group by contract, paymentmethod
)
select
    contract,
    paymentmethod,
    total_customers,
    churned_customers,
    churn_rate
from segment_analysis
where total_customers >= 500
  and churn_rate > 26.54
order by churn_rate desc;


## At risk customer list
select
    customerid,
    contract,
    tenure,
    paymentmethod,
    internetservice,
    techsupport,
    onlinesecurity,
    monthlycharges,
    riskfactorcount,
    risksegment,
    churn
from customer_churn
where riskfactorcount >= 4
order by riskfactorcount desc, monthlycharges desc;


## Actual churn rate
select
    count(*) as at_risk_customers,
    sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
    round(
        sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*),
        2
    ) as churn_rate
from customer_churn
where riskfactorcount >= 4;


## Impact
select
    churn,
    count(*) as total_customers,
    round(avg(monthlycharges), 2) as avg_monthly_charges,
    round(avg(totalcharges), 2) as avg_total_charges,
    round(sum(monthlycharges), 2) as total_monthly_charges
from customer_churn
group by churn
order by churn desc;





