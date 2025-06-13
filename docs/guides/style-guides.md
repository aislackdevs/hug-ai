# Style Guides

## Overview

Style guides in **HUG AI** development serve a dual purpose: they ensure code consistency and quality across human developers, and they provide essential guidance for AI agents to generate code that aligns with project standards. This document provides comprehensive style guides for various languages and frameworks, along with guidance on how to customize them for AI agents.

## Language-Specific Style Guides

### JavaScript/TypeScript Style Guide

#### Code Organization

**File Structure**:
```typescript
// 1. Imports (organized by type and alphabetically)
import React, { useState, useEffect } from 'react';  // React imports first
import { useNavigate } from 'react-router-dom';      // Third-party libraries
import { formatDate } from '@/utils/date';           // Internal absolute imports
import styles from './Component.module.css';         // Styles

// 2. Type definitions and interfaces
interface ComponentProps {
  title: string;
  items: Item[];
}

// 3. Component/function declaration
function Component({ title, items }: ComponentProps) {
  // 4. Hooks
  const [state, setState] = useState<string>('');
  const navigate = useNavigate();
  
  // 5. Helper functions and handlers
  const handleClick = () => {
    setState('clicked');
    navigate('/next-page');
  };
  
  // 6. Effects
  useEffect(() => {
    // Effect logic
  }, [items]);
  
  // 7. Render methods or return statement
  return (
    <div className={styles.container}>
      <h1>{title}</h1>
      {/* JSX content */}
    </div>
  );
}

// 8. Exports
export default Component;
```

#### Naming Conventions

- **Variables and Functions**: Use camelCase (e.g., `userData`, `fetchUserData()`)
- **Components**: Use PascalCase (e.g., `UserProfile`, `NavigationBar`)
- **Interfaces and Types**: Use PascalCase (e.g., `UserData`, `ApiResponse`)
- **Constants**: Use UPPER_SNAKE_CASE for true constants (e.g., `MAX_RETRY_COUNT`)
- **Filenames**: Use kebab-case for files (e.g., `user-profile.tsx`, `api-client.ts`)
- **CSS Classes**: Use kebab-case (e.g., `user-avatar`, `nav-item`)

#### Formatting

- Indentation: 2 spaces
- Line length: Max 100 characters
- Semicolons: Required
- Quotes: Single quotes for strings, double quotes for JSX attributes
- Trailing commas: Required for multi-line arrays and objects
- Braces: Always use braces for control statements
- Arrow function parentheses: Always use parentheses around parameters

#### Typescript-Specific Rules

- Always define return types for functions except for React components
- Use interfaces for object shapes (including props and state)
- Use type for unions, intersections, and mapped types
- Always use the strictest access modifiers applicable
- Prefer readonly for immutable properties
- Avoid using `any` - use `unknown` if the type is truly unknown

#### React-Specific Rules

- Use functional components with hooks instead of class components
- Keep components small and focused on a single responsibility
- Extract complex logic into custom hooks
- Use memo, useMemo, and useCallback appropriately for performance optimization
- Prefer controlled components over uncontrolled components
- Use prop destructuring in function parameters
- Explicitly type props using interfaces
- Use CSS modules or styled-components for styling

### Python Style Guide

#### Code Organization

**File Structure**:
```python
#!/usr/bin/env python3
"""
Module docstring describing the purpose of the module.
"""

# 1. Standard library imports
import os
import sys
from typing import List, Dict, Optional

# 2. Third-party imports
import numpy as np
import pandas as pd

# 3. Local application imports
from app.utils import helper_function
from app.models import SomeModel

# 4. Constants
MAX_RETRIES = 3
DEFAULT_TIMEOUT = 30

# 5. Class definitions
class ExampleClass:
    """
    Class docstring describing the purpose of the class.
    """
    
    def __init__(self, param1: str, param2: Optional[int] = None):
        """
        Constructor docstring.
        
        Args:
            param1: Description of param1
            param2: Description of param2
        """
        self.param1 = param1
        self.param2 = param2 or 0
    
    def method_name(self, arg1: str) -> bool:
        """
        Method docstring.
        
        Args:
            arg1: Description of arg1
            
        Returns:
            Description of return value
        """
        # Method implementation
        return True

# 6. Function definitions
def function_name(arg1: str, arg2: int = 0) -> Dict[str, any]:
    """
    Function docstring.
    
    Args:
        arg1: Description of arg1
        arg2: Description of arg2
        
    Returns:
        Description of return value
        
    Raises:
        ValueError: When arg1 is empty
    """
    if not arg1:
        raise ValueError("arg1 cannot be empty")
    
    # Function implementation
    return {"result": arg1}

# 7. Main execution (if applicable)
if __name__ == "__main__":
    example = ExampleClass("test")
    result = function_name("example")
    print(result)
```

#### Naming Conventions

- **Variables and Functions**: Use snake_case (e.g., `user_data`, `fetch_user_data()`)
- **Classes**: Use PascalCase (e.g., `UserProfile`, `ApiClient`)
- **Constants**: Use UPPER_SNAKE_CASE (e.g., `MAX_RETRY_COUNT`)
- **Private Methods/Variables**: Prefix with underscore (e.g., `_private_method`, `_internal_var`)
- **Filenames**: Use snake_case (e.g., `user_profile.py`, `api_client.py`)
- **Modules**: Use short, lowercase names (e.g., `utils.py`, `models.py`)

#### Formatting

- Indentation: 4 spaces
- Line length: Max 88 characters (Black formatter standard)
- Quotes: Prefer double quotes for strings
- Line breaks: Use parentheses for line continuation
- Import order: Standard library, third-party, local application
- Use explicit line continuation rather than implicit
- Add whitespace around operators and after commas

#### Type Annotations

- Use type hints for function parameters and return values
- Use `Optional` for parameters that could be None
- Use `Union` for parameters that could be multiple types
- Use `Any` sparingly, only when necessary
- Use collection types with their contained types specified (e.g., `List[str]`, `Dict[str, int]`)

#### Documentation

- Use docstrings for all modules, classes, and functions
- Follow Google style docstrings with Args, Returns, and Raises sections
- Document parameters, return values, and exceptions
- Add examples in docstrings for complex functions

#### Python-Specific Rules

- Follow the Zen of Python (PEP 20)
- Prefer list comprehensions over map and filter when appropriate
- Use f-strings for string formatting (Python 3.6+)
- Use context managers (`with` statement) for resource management
- Avoid global variables
- Use generator expressions for large datasets
- Prefer composition over inheritance
- Use `is` for comparing with `None`, `True`, and `False`

### Java Style Guide

#### Code Organization

**File Structure**:
```java
/*
 * Copyright notice if applicable
 */

// 1. Package declaration
package com.example.project.module;

// 2. Imports (organized by package level, alphabetically)
import java.util.ArrayList;
import java.util.List;

import com.example.project.OtherClass;
import com.example.project.util.HelperUtil;

// 3. Class or interface declaration with Javadoc
/**
 * Class description and purpose.
 * 
 * @author Developer Name
 */
public class ExampleClass {
    
    // 4. Static variables
    private static final int MAX_COUNT = 100;
    
    // 5. Instance variables
    private final String name;
    private int count;
    
    // 6. Constructors
    /**
     * Constructor description.
     * 
     * @param name description of parameter
     */
    public ExampleClass(String name) {
        this.name = name;
        this.count = 0;
    }
    
    // 7. Public methods
    /**
     * Method description.
     * 
     * @param parameter description of parameter
     * @return description of return value
     * @throws ExceptionType when exception occurs
     */
    public List<String> methodName(String parameter) throws ExceptionType {
        if (parameter == null) {
            throw new IllegalArgumentException("Parameter cannot be null");
        }
        
        // Method implementation
        return new ArrayList<>();
    }
    
    // 8. Private helper methods
    private void helperMethod() {
        // Helper method implementation
    }
    
    // 9. Getters and setters
    public String getName() {
        return name;
    }
    
    public int getCount() {
        return count;
    }
    
    public void setCount(int count) {
        this.count = count;
    }
}
```

#### Naming Conventions

- **Variables and Methods**: Use camelCase (e.g., `userData`, `fetchUserData()`)
- **Classes and Interfaces**: Use PascalCase (e.g., `UserProfile`, `ApiClient`)
- **Constants**: Use UPPER_SNAKE_CASE (e.g., `MAX_RETRY_COUNT`)
- **Packages**: Use lowercase, with dots separating hierarchy levels (e.g., `com.example.project.module`)
- **Filenames**: Match the class name exactly (e.g., `UserProfile.java`)

#### Formatting

- Indentation: 4 spaces
- Line length: Max 100 characters
- Braces: Opening brace at the end of the line, closing brace on its own line
- Spaces around operators and after commas
- One statement per line
- One variable declaration per line
- Blank lines between methods and logical sections
- No spaces between method name and parameter list
- Wrapped lines should be indented by 8 spaces

#### Documentation

- Use Javadoc for all public classes and methods
- Include `@param`, `@return`, and `@throws` tags as appropriate
- Document all exceptions that can be thrown
- Include examples for complex methods
- Keep descriptions clear and concise

#### Java-Specific Rules

- Always use braces for control statements, even for single-line bodies
- Prefer interfaces over abstract classes when possible
- Use functional interfaces and lambda expressions for simple callbacks
- Avoid wildcard imports
- Prefer composition over inheritance
- Use try-with-resources for automatic resource management
- Make fields final when possible
- Use the `@Override` annotation for methods that override superclass methods
- Prefer primitive types over boxed primitives unless nullability is required
- Use StringBuilder for string concatenation in loops

### Go Style Guide

#### Code Organization

**File Structure**:
```go
// Package comment describing the package's purpose
package example

import (
    "context"
    "fmt"
    "time"
    
    "github.com/pkg/errors"
    
    "example.com/project/internal/util"
)

// Type definitions and interfaces
type ExampleService interface {
    DoSomething(ctx context.Context, param string) (Result, error)
}

// Result represents the outcome of an operation
type Result struct {
    ID        string
    Timestamp time.Time
    Data      []byte
}

// Constants
const (
    DefaultTimeout = 30 * time.Second
    MaxRetries     = 3
)

// Global variables (use sparingly)
var defaultClient *http.Client

// Implementation structures
type exampleServiceImpl struct {
    client     *http.Client
    baseURL    string
    retryCount int
}

// NewExampleService creates a new instance of the ExampleService
func NewExampleService(baseURL string) ExampleService {
    return &exampleServiceImpl{
        client:     defaultClient,
        baseURL:    baseURL,
        retryCount: MaxRetries,
    }
}

// DoSomething implements the ExampleService interface
func (s *exampleServiceImpl) DoSomething(ctx context.Context, param string) (Result, error) {
    if param == "" {
        return Result{}, errors.New("param cannot be empty")
    }
    
    // Implementation
    result := Result{
        ID:        "example",
        Timestamp: time.Now(),
        Data:      []byte("example data"),
    }
    
    return result, nil
}

// Helper functions
func formatResult(r Result) string {
    return fmt.Sprintf("Result: %s at %v", r.ID, r.Timestamp)
}
```

#### Naming Conventions

- **Variables and Functions**: Use camelCase (e.g., `userData`, `fetchUserData`)
- **Exported (Public) Items**: Use PascalCase (e.g., `UserProfile`, `NewClient`)
- **Unexported (Private) Items**: Use camelCase (e.g., `userData`, `newClient`)
- **Interfaces**: Name should end with 'er' when the interface has a single method (e.g., `Reader`, `Writer`)
- **Acronyms**: Keep acronyms uppercase (e.g., `HTTPClient`, `APIRequest`)
- **Filenames**: Use snake_case (e.g., `user_profile.go`, `api_client.go`)
- **Packages**: Use short, lowercase, single-word names (e.g., `http`, `io`)

#### Formatting

- Follow `gofmt` standard formatting
- Indentation: Tabs (not spaces)
- Line length: Avoid extremely long lines, but no strict limit
- Group related imports and separate standard library, third-party, and local imports
- Use blank lines to separate logical sections
- Use parentheses sparingly for expressions
- Order struct fields for optimal memory alignment

#### Documentation

- Every exported function, type, and variable should have a comment
- Begin comments with the name of the item being documented
- Follow the "comment, then code" pattern
- Use complete sentences with proper punctuation
- Write documentation for the user, not the implementer
- Examples should be runnable and tested with the package

#### Go-Specific Rules

- Prefer error handling by returning errors rather than using exceptions
- Use the context package for managing cancellation and deadlines
- Accept interfaces, return structs
- Keep interfaces small and focused
- Avoid global variables
- Prefer composition over inheritance
- Use named return values for better documentation
- Use defer for cleanup operations
- Handle all errors explicitly
- Prefer table-driven tests

## Framework-Specific Style Guides

### React Style Guide

#### Component Structure

**Functional Component Template**:
```tsx
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux';

import { fetchData } from '@/store/actions';
import { Button } from '@/components/ui';
import { formatDate } from '@/utils/date';
import styles from './ComponentName.module.css';

interface ComponentProps {
  title: string;
  items: Item[];
  onAction: (id: string) => void;
}

/**
 * ComponentName displays a list of items with actions.
 */
const ComponentName: React.FC<ComponentProps> = ({ title, items, onAction }) => {
  // State hooks
  const [selectedId, setSelectedId] = useState<string | null>(null);
  
  // Redux hooks
  const dispatch = useDispatch();
  const { loading, error } = useSelector((state) => state.data);
  
  // Router hooks
  const navigate = useNavigate();
  
  // Event handlers
  const handleItemClick = (id: string) => {
    setSelectedId(id);
    onAction(id);
  };
  
  const handleNavigate = () => {
    navigate('/details/' + selectedId);
  };
  
  // Side effects
  useEffect(() => {
    dispatch(fetchData());
  }, [dispatch]);
  
  // Render helpers
  const renderItem = (item: Item) => (
    <li
      key={item.id}
      className={styles.item}
      data-selected={item.id === selectedId}
      onClick={() => handleItemClick(item.id)}
    >
      <span className={styles.itemName}>{item.name}</span>
      <span className={styles.itemDate}>{formatDate(item.date)}</span>
    </li>
  );
  
  // Component rendering
  if (loading) return <div className={styles.loading}>Loading...</div>;
  if (error) return <div className={styles.error}>{error}</div>;
  
  return (
    <div className={styles.container}>
      <h2 className={styles.title}>{title}</h2>
      
      {items.length === 0 ? (
        <p className={styles.empty}>No items available</p>
      ) : (
        <ul className={styles.list}>
          {items.map(renderItem)}
        </ul>
      )}
      
      {selectedId && (
        <div className={styles.actions}>
          <Button onClick={handleNavigate}>View Details</Button>
        </div>
      )}
    </div>
  );
};

export default ComponentName;
```

#### Hooks Organization

```tsx
// Custom hook example
import { useState, useEffect, useCallback } from 'react';

interface UseDataResult<T> {
  data: T | null;
  loading: boolean;
  error: string | null;
  fetchData: () => Promise<void>;
}

export function useData<T>(url: string): UseDataResult<T> {
  // State declarations grouped together
  const [data, setData] = useState<T | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  
  // Memoized functions
  const fetchData = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);
      
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`HTTP error ${response.status}`);
      }
      
      const result = await response.json();
      setData(result);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Unknown error');
    } finally {
      setLoading(false);
    }
  }, [url]);
  
  // Effects
  useEffect(() => {
    fetchData();
  }, [fetchData]);
  
  // Return object with named properties for destructuring
  return { data, loading, error, fetchData };
}
```

#### State Management

```tsx
// Redux slice example (using Redux Toolkit)
import { createSlice, PayloadAction, createAsyncThunk } from '@reduxjs/toolkit';
import { fetchUserProfile } from '@/api/user';

interface UserState {
  profile: UserProfile | null;
  loading: boolean;
  error: string | null;
}

const initialState: UserState = {
  profile: null,
  loading: false,
  error: null,
};

// Async thunk for side effects
export const getUserProfile = createAsyncThunk(
  'user/getProfile',
  async (userId: string, { rejectWithValue }) => {
    try {
      const response = await fetchUserProfile(userId);
      return response.data;
    } catch (err) {
      return rejectWithValue(err instanceof Error ? err.message : 'Failed to fetch profile');
    }
  }
);

// Slice definition
const userSlice = createSlice({
  name: 'user',
  initialState,
  reducers: {
    resetProfile: (state) => {
      state.profile = null;
      state.error = null;
    },
    updateUserPreferences: (state, action: PayloadAction<UserPreferences>) => {
      if (state.profile) {
        state.profile.preferences = action.payload;
      }
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(getUserProfile.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(getUserProfile.fulfilled, (state, action) => {
        state.profile = action.payload;
        state.loading = false;
      })
      .addCase(getUserProfile.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload as string || 'Unknown error';
      });
  },
});

export const { resetProfile, updateUserPreferences } = userSlice.actions;
export default userSlice.reducer;
```

#### CSS Modules Organization

```css
/* ComponentName.module.css */

/* 1. Variables */
:root {
  --primary-color: #3498db;
  --secondary-color: #2ecc71;
  --error-color: #e74c3c;
  --text-color: #333;
  --spacing-unit: 8px;
}

/* 2. Container and layout */
.container {
  display: flex;
  flex-direction: column;
  padding: calc(var(--spacing-unit) * 2);
  max-width: 800px;
  margin: 0 auto;
}

.title {
  font-size: 24px;
  margin-bottom: calc(var(--spacing-unit) * 3);
  color: var(--text-color);
}

/* 3. List and items */
.list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.item {
  display: flex;
  justify-content: space-between;
  padding: calc(var(--spacing-unit) * 2);
  border-bottom: 1px solid #eee;
  cursor: pointer;
  transition: background-color 0.2s ease;
}

.item:hover {
  background-color: rgba(0, 0, 0, 0.05);
}

.item[data-selected="true"] {
  background-color: rgba(52, 152, 219, 0.1);
  border-left: 3px solid var(--primary-color);
}

.itemName {
  font-weight: 500;
}

.itemDate {
  color: #666;
  font-size: 14px;
}

/* 4. States and feedback */
.empty {
  text-align: center;
  padding: calc(var(--spacing-unit) * 4);
  color: #666;
  font-style: italic;
}

.loading {
  text-align: center;
  padding: calc(var(--spacing-unit) * 4);
  color: var(--text-color);
}

.error {
  color: var(--error-color);
  padding: calc(var(--spacing-unit) * 2);
  border: 1px solid var(--error-color);
  border-radius: 4px;
  margin-bottom: calc(var(--spacing-unit) * 2);
}

/* 5. Action areas */
.actions {
  display: flex;
  justify-content: flex-end;
  margin-top: calc(var(--spacing-unit) * 3);
  padding-top: calc(var(--spacing-unit) * 2);
  border-top: 1px solid #eee;
}

/* 6. Media queries */
@media (max-width: 600px) {
  .container {
    padding: var(--spacing-unit);
  }
  
  .item {
    flex-direction: column;
    gap: var(--spacing-unit);
  }
}
```

### Django Style Guide

#### Project Structure

```
my_project/
├── manage.py
├── my_project/
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings/
│   │   ├── __init__.py
│   │   ├── base.py
│   │   ├── development.py
│   │   ├── production.py
│   │   └── test.py
│   ├── urls.py
│   └── wsgi.py
├── apps/
│   ├── accounts/
│   │   ├── __init__.py
│   │   ├── admin.py
│   │   ├── apps.py
│   │   ├── forms.py
│   │   ├── managers.py
│   │   ├── migrations/
│   │   ├── models.py
│   │   ├── serializers.py
│   │   ├── services.py
│   │   ├── tests/
│   │   │   ├── __init__.py
│   │   │   ├── test_forms.py
│   │   │   ├── test_models.py
│   │   │   └── test_views.py
│   │   ├── urls.py
│   │   └── views.py
│   └── other_app/
│       └── ...
├── static/
├── templates/
├── media/
├── requirements/
│   ├── base.txt
│   ├── development.txt
│   └── production.txt
└── docker/
    ├── Dockerfile
    └── docker-compose.yml
```

#### Models Structure

```python
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.conf import settings

class TimeStampedModel(models.Model):
    """
    An abstract base class model that provides
    self-updating created and modified fields.
    """
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class Category(TimeStampedModel):
    """
    A category for organizing products.
    """
    name = models.CharField(_("Name"), max_length=100)
    slug = models.SlugField(_("Slug"), unique=True)
    description = models.TextField(_("Description"), blank=True)
    
    class Meta:
        verbose_name = _("Category")
        verbose_name_plural = _("Categories")
        ordering = ["name"]
    
    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        from django.urls import reverse
        return reverse("category_detail", kwargs={"slug": self.slug})

class Product(TimeStampedModel):
    """
    A product available for purchase.
    """
    STATUS_CHOICES = (
        ("draft", _("Draft")),
        ("published", _("Published")),
        ("archived", _("Archived")),
    )
    
    category = models.ForeignKey(
        Category, 
        on_delete=models.CASCADE,
        related_name="products",
        verbose_name=_("Category")
    )
    created_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        related_name="created_products",
        verbose_name=_("Created by")
    )
    title = models.CharField(_("Title"), max_length=200)
    slug = models.SlugField(_("Slug"), unique=True)
    description = models.TextField(_("Description"))
    price = models.DecimalField(_("Price"), max_digits=10, decimal_places=2)
    stock = models.PositiveIntegerField(_("Stock"), default=0)
    status = models.CharField(
        _("Status"),
        max_length=10,
        choices=STATUS_CHOICES,
        default="draft"
    )
    featured = models.BooleanField(_("Featured"), default=False)
    
    class Meta:
        verbose_name = _("Product")
        verbose_name_plural = _("Products")
        ordering = ["-created_at"]
        indexes = [
            models.Index(fields=["status", "featured"]),
            models.Index(fields=["slug"]),
        ]
    
    def __str__(self):
        return self.title
    
    def get_absolute_url(self):
        from django.urls import reverse
        return reverse("product_detail", kwargs={"slug": self.slug})
    
    @property
    def is_in_stock(self):
        return self.stock > 0
```

#### Views Structure

```python
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, DetailView, CreateView, UpdateView
from django.urls import reverse_lazy
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated

from .models import Product, Category
from .forms import ProductForm
from .serializers import ProductSerializer
from .services import create_product, update_product

# Class-based views
class ProductListView(ListView):
    """
    Display a list of published products.
    """
    model = Product
    template_name = "products/product_list.html"
    context_object_name = "products"
    paginate_by = 10
    
    def get_queryset(self):
        queryset = super().get_queryset().filter(status="published")
        
        # Filter by category if specified
        category_slug = self.kwargs.get("category_slug")
        if category_slug:
            queryset = queryset.filter(category__slug=category_slug)
            
        return queryset
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["categories"] = Category.objects.all()
        
        category_slug = self.kwargs.get("category_slug")
        if category_slug:
            context["current_category"] = get_object_or_404(Category, slug=category_slug)
            
        return context

class ProductDetailView(DetailView):
    """
    Display details for a single product.
    """
    model = Product
    template_name = "products/product_detail.html"
    context_object_name = "product"
    
    def get_queryset(self):
        return super().get_queryset().filter(status="published")

class ProductCreateView(LoginRequiredMixin, CreateView):
    """
    Create a new product.
    """
    model = Product
    form_class = ProductForm
    template_name = "products/product_form.html"
    success_url = reverse_lazy("product_list")
    
    def form_valid(self, form):
        product = form.save(commit=False)
        product.created_by = self.request.user
        create_product(product)
        return HttpResponseRedirect(self.success_url)

# API views
class ProductAPIView(APIView):
    """
    API endpoint for product list and creation.
    """
    permission_classes = [IsAuthenticated]
    
    def get(self, request, format=None):
        """
        Get a list of products.
        """
        products = Product.objects.filter(status="published")
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)
    
    def post(self, request, format=None):
        """
        Create a new product.
        """
        serializer = ProductSerializer(data=request.data)
        if serializer.is_valid():
            product = serializer.save(created_by=request.user)
            return Response(
                ProductSerializer(product).data,
                status=status.HTTP_201_CREATED
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
```

#### Services Pattern

```python
"""
Service module for product-related business logic.
Separates business logic from views and models.
"""
from django.utils import timezone
from django.utils.text import slugify
from django.db import transaction

from .models import Product

def create_product(product):
    """
    Create a new product with proper slug generation.
    
    Args:
        product: A Product instance that hasn't been saved yet
        
    Returns:
        The saved Product instance
    """
    if not product.slug:
        base_slug = slugify(product.title)
        slug = base_slug
        counter = 1
        
        # Ensure slug uniqueness
        while Product.objects.filter(slug=slug).exists():
            slug = f"{base_slug}-{counter}"
            counter += 1
            
        product.slug = slug
    
    product.save()
    return product

@transaction.atomic
def update_product(product, data):
    """
    Update a product with the given data.
    
    Args:
        product: A Product instance to update
        data: Dictionary of fields to update
        
    Returns:
        The updated Product instance
    """
    # Update fields from data dictionary
    for key, value in data.items():
        if hasattr(product, key):
            setattr(product, key, value)
    
    # If title changed, update slug
    if 'title' in data:
        base_slug = slugify(product.title)
        slug = base_slug
        counter = 1
        
        # Ensure slug uniqueness but exclude current product
        while Product.objects.filter(slug=slug).exclude(id=product.id).exists():
            slug = f"{base_slug}-{counter}"
            counter += 1
            
        product.slug = slug
    
    product.save()
    return product

def publish_product(product):
    """
    Publish a product.
    
    Args:
        product: A Product instance to publish
        
    Returns:
        The published Product instance
    """
    product.status = "published"
    product.save()
    return product

def archive_product(product):
    """
    Archive a product.
    
    Args:
        product: A Product instance to archive
        
    Returns:
        The archived Product instance
    """
    product.status = "archived"
    product.save()
    return product
```

## AI-Specific Style Guide Extensions

### Context Hints for AI Agents

To help AI agents understand your codebase better, consider adding specific context hints in comments:

```typescript
// @ai-context: This component handles user authentication flow
// @ai-dependencies: Uses AuthContext from src/contexts/AuthContext
// @ai-styling: Follows Tailwind CSS conventions
function LoginForm() {
  // ...
}
```

### Code Generation Parameters

When you want AI to generate code in a specific way, include generation parameters:

```typescript
// @ai-generate: component
// @ai-style: functional-component
// @ai-props-interface: true
// @ai-include-tests: true
```

### Style Enforcement

Create specific guides for **HUG AI** style enforcement:

```typescript
/**
 * @ai-enforce
 * Rules to enforce for this file:
 * - Maximum line length: 100 characters
 * - No implicit any types
 * - Use arrow functions for event handlers
 * - Place hooks at the top of components
 * - Destructure props in function parameters
 */
```

### Type Definitions

Guide AI on how to handle types:

```typescript
/**
 * @ai-types
 * For this module:
 * - Create interfaces for data structures
 * - Use Pick/Omit/Partial for derived types
 * - Use union types for API responses with different states
 * - Export all public interfaces and types
 */
```

### Documentation Generation

Guide AI on generating documentation:

```typescript
/**
 * @ai-docs
 * Documentation should include:
 * - Function purpose
 * - Parameter descriptions
 * - Return value details
 * - Example usage
 * - Any side effects
 */
```

## Customizing Style Guides for Your Team

### Creating a Project-Specific Style Guide

1. Fork the base style guides for languages and frameworks you're using
2. Modify rules to match your team's preferences
3. Add project-specific conventions and patterns
4. Document AI-specific extensions
5. Create a style guide repository or include in project documentation

### Implementation with Linters and Formatters

Configure linting and formatting tools to match your style guide:

```json
// .eslintrc.json example
{
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:react/recommended",
    "plugin:react-hooks/recommended"
  ],
  "plugins": ["@typescript-eslint", "react", "react-hooks"],
  "rules": {
    "max-len": ["error", { "code": 100, "ignoreComments": true }],
    "quotes": ["error", "single"],
    "semi": ["error", "always"],
    "react/prop-types": "off",
    "react/react-in-jsx-scope": "off",
    "@typescript-eslint/explicit-module-boundary-types": "error",
    "@typescript-eslint/no-explicit-any": "error"
  }
}
```

```json
// .prettierrc.json example
{
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false,
  "semi": true,
  "singleQuote": true,
  "jsxSingleQuote": false,
  "trailingComma": "es5",
  "bracketSpacing": true,
  "jsxBracketSameLine": false,
  "arrowParens": "always"
}
```

### AI Assistance Configuration

Configure your AI coding assistants to follow your style guide:

```json
// ai-config.json example
{
  "styleguide": {
    "paths": ["./docs/style-guides/"],
    "primary_language": "typescript",
    "frameworks": ["react", "node"],
    "linting_rules": {
      "include_eslint": true,
      "include_prettier": true
    }
  },
  "code_generation": {
    "follow_file_structure": true,
    "match_surrounding_style": true,
    "add_comments": true,
    "documentation_style": "jsdoc"
  },
  "context_loading": {
    "include_related_files": true,
    "include_test_files": true,
    "include_style_guides": true
  }
}
```

### Style Guide Evolution

Guidelines for evolving your style guide:

1. **Regular Reviews**: Schedule quarterly reviews of your style guide
2. **Feedback Collection**: Gather feedback from team members on what's working and what's not
3. **AI Agent Performance**: Track how well AI agents follow your style guide and adjust as needed
4. **New Technologies**: Update as you adopt new frameworks or libraries
5. **Automated Enforcement**: Continually improve linting and formatting rules to match your guide

## Conclusion

A comprehensive style guide is essential for maintaining consistent, high-quality code, especially in **HUG AI** development. By clearly documenting conventions, patterns, and expectations, you provide both human developers and AI agents with the guidance needed to create code that's maintainable, readable, and aligned with your team's practices.

Remember that style guides should evolve with your team and technology. Regular reviews and updates keep your guide relevant and effective, ensuring that both human and AI contributors can work together seamlessly.