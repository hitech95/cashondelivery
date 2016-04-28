{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}
    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='cashondelivery'}">{l s='Checkout' mod='cashondelivery'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Cash on delivery (COD) payment' mod='cashondelivery'}
{/capture}

<h1 class="page-heading">
	{l s='Order summary' mod='cashondelivery'}
</h1>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
    <p class="alert alert-warning">
        {l s='Your shopping cart is empty.' mod='cashondelivery'}
    </p>
{else}
	<form action="{$link->getModuleLink('cashondelivery', 'validation', [], true)|escape:'html'}" method="post">
		<div class="box">
			<h3 class="page-subheading">
				{l s='Cash on delivery (COD) payment' mod='cashondelivery'}
			</h3>
			<p class="cheque-indent">
				<strong class="dark">
					{l s='You have chosen to pay by cod.' mod='cashondelivery'} {l s='Here is a short summary of your order:' mod='cashondelivery'}
				</strong>
			</p>			
			<p>
                - {l s='The total amount of your order is' mod='cashondelivery'}
                <span id="amount" class="price">{displayPrice price=$total}</span>
                {if $use_taxes == 1}
                    {l s='(tax incl.)' mod='cashondelivery'}
                {/if}
            </p>
			<p>
				- {l s='Please confirm your order by clicking \'I confirm my order\'.' mod='cashondelivery'}
			</p>        
		</div>
		<p class="cart_navigation clearfix" id="cart_navigation">
			<a  class="button-exclusive btn btn-default" href="{$link->getPageLink('order', true)}?step=3">
				<i class="icon-chevron-left"></i>{l s='Other payment methods' mod='cashondelivery'}
			</a>
			<button class="button btn btn-default button-medium" type="submit" >
				<span>{l s='I confirm my order' mod='cashondelivery'}<i class="icon-chevron-right right"></i></span>
			</button>
		</p>
	</form>
{/if}