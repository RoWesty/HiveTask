import pandas as pd
from datetime import date

file_directory_people = ".\people.csv"
file_directory_organizations = ".\organizations.csv"
file_directory_customers = ".\customers.csv"
people = pd.read_csv(file_directory_people)
organizations = pd.read_csv(file_directory_organizations)
customers = pd.read_csv(file_directory_customers)
def people_Age():
    Date_of_birth = people["Date of birth"]
    split_date_of_birth = Date_of_birth.str.split('-')
    Age = []
    for i in split_date_of_birth:
        for z in i:
            if len(z) == 4:
                result = int(date.today().year) - int(z)
                if result <= 18:
                    Age.append("0-18")
                elif result <= 25 and result >= 19:
                    Age.append("19-25")
                elif result <= 35 and result >= 26:
                    Age.append("26-35")
                elif result <= 46 and result >= 36:
                    Age.append("36-46")
                elif result <= 57 and result >= 47:
                    Age.append("47-57")
                elif result <= 68 and result >= 58:
                    Age.append("58-68")
                elif result <= 79 and result >= 69:
                    Age.append("69-79")
                elif result <= 90 and result >= 80:
                    Age.append("80-90")
                elif result <= 100 and result >= 91:
                    Age.append("91-100")
                elif result <= 120 and result >= 101:
                    Age.append("101-120")
                else:
                    print("not age in spisok")
    people['Age_group'] = Age
    people.to_csv('people.csv', index=False)

def subscriptions_years():
    subscriptions_date = customers["Subscription Date"]
    split_subscriptions_date = subscriptions_date.str.split('-')
    years = []
    for i in split_subscriptions_date:
        for z in i:
            if len(z) == 4:
                years.append(z)
    customers['subscriptions Year'] = years
    customers.to_csv('customers.csv', index=False)

def Age_years():
    Founded_date = organizations["Founded"]
    years = []
    for i in Founded_date:
        result = int(date.today().year) - int(i)
        if result <= 18:
            years.append("0-18")
        elif result <= 25 and result >= 19:
            years.append("19-25")
        elif result <= 35 and result >= 26:
            years.append("26-35")
        elif result <= 46 and result >= 36:
            years.append("36-46")
        elif result <= 57 and result >= 47:
            years.append("47-57")
        elif result <= 68 and result >= 58:
            years.append("58-68")
        elif result <= 79 and result >= 69:
            years.append("69-79")
        elif result <= 90 and result >= 80:
            years.append("80-90")
        elif result <= 100 and result >= 91:
            years.append("91-100")
        elif result <= 120 and result >= 101:
            years.append("101-120")
        else:
            print("not age in spisok")
    organizations['Founded_Age'] = years
    organizations.to_csv('organizations.csv', index=False)
people_Age()
subscriptions_years()
Age_years()
