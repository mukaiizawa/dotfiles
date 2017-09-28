# coding: utf-8

# util
def mkRand(num = 10000):
  result = []
  for i in range(num):
    result.append(random.randint(0, 999))
  return result

def show(lis):
  for i in range(len(lis)):
    print(lis[i])

def swap(lis, i, j):
  result = copy.deepcopy(lis)
  tmp = result[i]
  result[i] = result[j]
  result[j] = tmp
  return result

# sorting function
def bable(lis):
  for i in range(len(lis)-1):
    for j in range (len(lis)-1-i):
      if lis[j]>lis[j+1]:
        lis = c.swap(lis, j, j+1)
  return lis

def insertion(lis):
  for i in range(len(lis)-1):
    for j in reversed(range(i+1)):
      if lis[j]>lis[j+1]:
        lis = c.swap(lis, j, j+1)
      else:
        break
  return lis

def selection(lis):
  for i in range(len(lis)-1):
    min_index = i
    for j in range(i, len(lis)):
      if lis[min_index] > lis[j]:
        min_index = j
    lis = c.swap(lis, i, min_index)
  return lis

def quick(lis, left, right):
  print("l:" + str(left) + " r:"+ str(right))
  print(lis)
  if left>=right:
    return
  i = left
  j = right
  pivot = lis[i]
  while i<j:
    while lis[i]<pivot: i = i + 1
    while lis[j]>pivot: j = j - 1
    if i<j:
      lis = c.swap(lis, i, j)
      i = i + 1
      j = j - 1
  print(lis)
  quick(lis, left, i - 1)
  quick(lis, j + 1, right)
  return lis

def qsort(L):
    if len(L) <= 1: return L
    return qsort([lt for lt in L[1:] if lt < L[0]]) + L[0:1] + qsort([ge for ge in L[1:] if ge >= L[0]])

print("---------")
# print(bable(result))
# print(insertion(result))
# print(selection(result))
# print(quick(result, 0, len(result)-1))

print(qsort(result))
