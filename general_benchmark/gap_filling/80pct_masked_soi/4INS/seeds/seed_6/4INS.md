# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_6\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 6.184 A
- tm_score_ca_ordered: 0.38910238022272176
- heavy_atom_rmsd: 7.244 A
- sidechain_heavy_atom_rmsd: 8.211 A
- **all-atom quality (honest):** heavy 7.244 A, sidechain 8.211 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 24
- distogram_pairs: 1197
- bin_accuracy: 0.395

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=57
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.184045102688009
- ga_delta_rmsd: 2.2890136081023345  ga_fitness_mode: energy
- pre_local_rmsd: 6.205516113761175  localized_anchor_rmsd: 6.184069090864182

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y65-L71 → 265 conflicts (37%); P46-K47 → 107 conflicts (15%)
- explained: 372/715 conflicts by 2 root cause(s)
- metrics: hubs=82 (frac 0.872), conflicts/hub=8.7, max_incompat=14.71Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y65-L71 + P46-K47 — explain ~372/715 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L71** — severity 109.67, 36 conflict(s); suspect input ~`H75` (group: pull_in)
  - pull-in (wants closer): C57@8.0Å(now 11.2,conf 0.55), E31@14.3Å(now 16.9,conf 0.55), H75@6.2Å(now 10.0,conf 0.52)
  - push-out (wants farther): C66@11.1Å(now 7.1,conf 0.91), K47@26.8Å(now 8.6,conf 0.82), N64@15.6Å(now 4.1,conf 0.69), T45@21.3Å(now 14.5,conf 0.60), Y65@13.0Å(now 3.6,conf 0.58), C84@15.2Å(now 11.1,conf 0.55)
  - K47↔S74: targets 26.8/7.8Å but partners are 4.3Å apart → too_close_together by 14.7Å
  - K47↔L76: targets 26.8/4.9Å but partners are 8.7Å apart → too_close_together by 13.2Å
  - C66↔K47: targets 11.1/26.8Å but partners are 6.5Å apart → too_close_together by 9.3Å
- **H70** — severity 95.89, 24 conflict(s); suspect input ~`S74` (group: push_out)
  - push-out (wants farther): C5@27.5Å(now 24.0,conf 1.00), K47@27.5Å(now 11.6,conf 1.00), V67@11.0Å(now 7.3,conf 0.99), L24@27.0Å(now 19.9,conf 0.84), Y65@14.6Å(now 5.7,conf 0.79), V77@11.4Å(now 8.7,conf 0.79), C66@12.0Å(now 6.2,conf 0.72), T45@24.5Å(now 14.7,conf 0.71), L29@22.1Å(now 17.5,conf 0.64), G88@21.3Å(now 18.7,conf 0.60), G85@20.2Å(now 14.5,conf 0.58), S27@19.1Å(now 11.7,conf 0.56), Y34@17.7Å(now 15.0,conf 0.55), N64@16.5Å(now 4.1,conf 0.55), E63@15.5Å(now 3.4,conf 0.55), L82@15.6Å(now 12.6,conf 0.55), L62@11.9Å(now 3.6,conf 0.55), Y60@13.9Å(now 4.5,conf 0.55)
  - K47↔G73: targets 27.5/10.9Å but partners are 5.3Å apart → too_close_together by 11.3Å
  - K47↔L76: targets 27.5/8.9Å but partners are 8.7Å apart → too_close_together by 9.9Å
  - K47↔S74: targets 27.5/11.0Å but partners are 4.3Å apart → too_close_together by 12.2Å
- **C57** — severity 79.47, 26 conflict(s); suspect input ~`N68` (group: push_out)
  - pull-in (wants closer): V20@27.5Å(now 30.1,conf 1.00), N21@27.5Å(now 31.5,conf 1.00), N68@5.3Å(now 12.3,conf 0.56), Q69@5.7Å(now 8.8,conf 0.55), G85@18.4Å(now 22.6,conf 0.55), T92@16.1Å(now 22.7,conf 0.55), L71@8.0Å(now 11.2,conf 0.55), L80@12.0Å(now 15.1,conf 0.55)
  - push-out (wants farther): K47@27.4Å(now 18.8,conf 0.97), P46@24.3Å(now 20.4,conf 0.72)
  - K47↔N68: targets 27.4/5.3Å but partners are 10.6Å apart → too_close_together by 11.5Å
  - K47↔L71: targets 27.4/8.0Å but partners are 8.6Å apart → too_close_together by 10.9Å
  - K47↔L62: targets 27.4/7.6Å but partners are 11.8Å apart → too_close_together by 8.0Å
- **K47** — severity 70.36, 26 conflict(s); suspect input ~`L71` (group: pull_in)
  - pull-in (wants closer): I9@16.7Å(now 25.7,conf 0.55), L24@15.3Å(now 20.8,conf 0.55), C6@12.3Å(now 22.3,conf 0.55), L15@15.8Å(now 20.0,conf 0.55), L29@14.1Å(now 17.1,conf 0.55)
  - push-out (wants farther): S55@27.5Å(now 21.1,conf 1.00), I56@27.5Å(now 19.7,conf 1.00), H70@27.5Å(now 11.6,conf 1.00), C57@27.4Å(now 18.8,conf 0.97), C53@20.8Å(now 18.2,conf 0.91), L71@26.8Å(now 8.6,conf 0.82), G38@22.8Å(now 16.4,conf 0.71), V36@20.9Å(now 16.1,conf 0.59), L62@20.5Å(now 11.8,conf 0.59), G41@19.8Å(now 11.9,conf 0.57), N64@19.6Å(now 10.5,conf 0.57), F42@16.2Å(now 11.0,conf 0.55)
  - E50↔L71: targets 13.0/26.8Å but partners are 7.9Å apart → too_close_together by 5.9Å
  - E50↔C57: targets 13.0/27.4Å but partners are 10.0Å apart → too_close_together by 4.4Å
  - F43↔L71: targets 9.2/26.8Å but partners are 12.3Å apart → too_close_together by 5.3Å
- **C72** — severity 68.66, 25 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): H75@5.1Å(now 12.1,conf 0.94), V77@7.3Å(now 10.1,conf 0.82), Y91@12.0Å(now 14.8,conf 0.55)
  - push-out (wants farther): P46@22.7Å(now 15.5,conf 0.70), N64@16.6Å(now 11.3,conf 0.55), Y65@15.0Å(now 10.0,conf 0.55), G41@13.6Å(now 10.0,conf 0.55)
  - H75↔P46: targets 5.1/22.7Å but partners are 8.2Å apart → too_close_together by 9.5Å
  - V77↔P46: targets 7.3/22.7Å but partners are 6.2Å apart → too_close_together by 9.2Å
  - P46↔E78: targets 22.7/8.5Å but partners are 6.0Å apart → too_close_together by 8.2Å
- **L62** — severity 63.75, 29 conflict(s); suspect input ~`G88` (group: push_out)
  - pull-in (wants closer): L59@3.3Å(now 6.3,conf 0.82), S58@4.4Å(now 7.4,conf 0.69), C66@3.8Å(now 8.0,conf 0.69), V83@7.1Å(now 11.3,conf 0.55), K94@16.3Å(now 19.3,conf 0.55), L82@9.9Å(now 14.7,conf 0.55), G88@12.0Å(now 20.0,conf 0.55)
  - push-out (wants farther): Q69@9.2Å(now 3.6,conf 0.82), K47@20.5Å(now 11.8,conf 0.59), N68@10.8Å(now 7.1,conf 0.55), H70@11.9Å(now 3.6,conf 0.55)
  - C66↔K47: targets 3.8/20.5Å but partners are 6.5Å apart → too_close_together by 10.2Å
  - K47↔Y65: targets 20.5/5.8Å but partners are 6.3Å apart → too_close_together by 8.4Å
  - S58↔G88: targets 4.4/12.0Å but partners are 23.8Å apart → too_far_apart by 7.4Å

## Secondary Structure (DSSP-like)

- helix(H)=56 · strand(E)=25 · 3-10(G)=11 · coil(C)=2

```
CHHHHEEHGECGHHGHHEHGEHHEHEHEHHHHHHEHEGHHHHHEHEGEEEEHEHEHHGHHEHHHGHHHHHHHHHGHGHHHHHHEHHEGHHEEEE
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=30 · sheet=28
  - Q4 ↔ S8  (helix)
  - Y13 ↔ N17  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - V36 ↔ R40  (helix)
  - E39 ↔ F43  (helix)
  - G41 ↔ T45  (helix)
  - C52 ↔ I56  (helix)
  - I56 ↔ Y60  (helix)
  - L59 ↔ E63  (helix)
  - Y60 ↔ N64  (helix)
  - L62 ↔ C66  (helix)
  - E63 ↔ V67  (helix)
  - N64 ↔ N68  (helix)
  - C66 ↔ H70  (helix)
  - V67 ↔ L71  (helix)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=48 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=494 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=292 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.5844 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=24 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
