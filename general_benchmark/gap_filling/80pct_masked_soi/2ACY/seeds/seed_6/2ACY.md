# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_6\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 5.152 A
- tm_score_ca_ordered: 0.5555524990690118
- heavy_atom_rmsd: 5.881 A
- sidechain_heavy_atom_rmsd: 6.507 A
- **all-atom quality (honest):** heavy 5.881 A, sidechain 6.507 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 30
- distogram_pairs: 1238
- bin_accuracy: 0.481

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.151786284293574
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 5.163779877198145  localized_anchor_rmsd: 5.15176795161407

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E1-I6 → 226 conflicts (38%); L64-G68 → 118 conflicts (20%)
- explained: 344/598 conflicts by 2 root cause(s)
- metrics: hubs=80 (frac 0.833), conflicts/hub=7.5, max_incompat=15.45Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E1-I6 + L64-G68 — explain ~344/598 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V96** — severity 99.28, 13 conflict(s); suspect input ~`D3` (group: push_out)
  - push-out (wants farther): E1@27.5Å(now 12.4,conf 1.00), D3@27.3Å(now 15.4,conf 0.92)
  - E1↔W37: targets 27.5/7.0Å but partners are 5.1Å apart → too_close_together by 15.4Å
  - W37↔D3: targets 7.0/27.3Å but partners are 7.9Å apart → too_close_together by 12.4Å
  - E1↔Y90: targets 27.5/13.0Å but partners are 3.8Å apart → too_close_together by 10.7Å
- **K71** — severity 63.13, 20 conflict(s); suspect input ~`K67` (group: pull_in)
  - pull-in (wants closer): G18@9.3Å(now 12.0,conf 0.55)
  - push-out (wants farther): D75@13.0Å(now 3.3,conf 1.00), S78@19.0Å(now 10.9,conf 1.00), N81@27.5Å(now 22.9,conf 0.99), R76@15.0Å(now 8.0,conf 0.99), E82@27.5Å(now 23.0,conf 0.98), E11@17.9Å(now 12.9,conf 0.55), G14@11.2Å(now 6.0,conf 0.55), A77@16.4Å(now 12.4,conf 0.55), I74@9.7Å(now 6.6,conf 0.55), F13@13.8Å(now 11.1,conf 0.55)
  - G68↔S78: targets 7.0/19.0Å but partners are 3.3Å apart → too_close_together by 8.7Å
  - S78↔K67: targets 19.0/8.6Å but partners are 3.8Å apart → too_close_together by 6.6Å
  - L64↔E82: targets 13.0/27.5Å but partners are 9.2Å apart → too_close_together by 5.3Å
- **T45** — severity 55.73, 10 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): G18@10.8Å(now 13.5,conf 0.55)
  - push-out (wants farther): E1@27.4Å(now 16.5,conf 0.95), S7@19.9Å(now 16.4,conf 0.58), Y10@10.4Å(now 7.2,conf 0.55)
  - E1↔G48: targets 27.4/10.6Å but partners are 6.1Å apart → too_close_together by 10.7Å
  - E1↔Q39: targets 27.4/8.9Å but partners are 9.5Å apart → too_close_together by 9.0Å
  - V38↔E1: targets 11.0/27.4Å but partners are 8.2Å apart → too_close_together by 8.3Å
- **G68** — severity 49.32, 20 conflict(s); suspect input ~`K83` (group: pull_in)
  - pull-in (wants closer): F21@6.4Å(now 10.2,conf 0.55)
  - push-out (wants farther): D75@11.0Å(now 4.5,conf 0.94), K87@27.3Å(now 24.8,conf 0.93), K83@23.1Å(now 17.6,conf 0.75), V84@24.7Å(now 21.0,conf 0.70), I6@20.9Å(now 17.6,conf 0.60), S7@19.6Å(now 15.8,conf 0.57), V8@17.4Å(now 14.3,conf 0.55), A77@10.7Å(now 6.2,conf 0.55)
  - L64↔K83: targets 5.1/23.1Å but partners are 11.0Å apart → too_close_together by 7.0Å
  - Q61↔K83: targets 10.9/23.1Å but partners are 6.9Å apart → too_close_together by 5.3Å
  - E62↔K83: targets 9.0/23.1Å but partners are 9.0Å apart → too_close_together by 5.1Å
- **E65** — severity 47.80, 17 conflict(s); suspect input ~`V86` (group: pull_in)
  - pull-in (wants closer): V16@11.5Å(now 16.0,conf 0.55), F21@12.5Å(now 15.4,conf 0.55), V46@12.1Å(now 14.6,conf 0.55)
  - push-out (wants farther): V86@26.6Å(now 19.0,conf 0.78), K87@26.2Å(now 22.0,conf 0.74), V84@21.1Å(now 16.3,conf 0.60), H80@13.9Å(now 7.1,conf 0.55), V8@14.0Å(now 11.1,conf 0.55)
  - R58↔V86: targets 11.0/26.6Å but partners are 8.6Å apart → too_close_together by 7.0Å
  - H59↔V86: targets 10.9/26.6Å but partners are 9.0Å apart → too_close_together by 6.7Å
  - E62↔V86: targets 5.4/26.6Å but partners are 14.8Å apart → too_close_together by 6.3Å
- **G44** — severity 44.24, 15 conflict(s); suspect input ~`D89` (group: push_out)
  - push-out (wants farther): L5@27.5Å(now 21.6,conf 1.00), D89@27.2Å(now 23.4,conf 0.90), N40@7.4Å(now 4.4,conf 0.79)
  - L5↔G48: targets 27.5/13.1Å but partners are 8.3Å apart → too_close_together by 6.0Å
  - L5↔Q49: targets 27.5/17.0Å but partners are 6.0Å apart → too_close_together by 4.5Å
  - L5↔Q47: targets 27.5/10.9Å but partners are 12.2Å apart → too_close_together by 4.5Å

## Secondary Structure (DSSP-like)

- helix(H)=45 · strand(E)=40 · 3-10(G)=7 · coil(C)=4

```
EHEHHEEEEEEHHHHHEHEHEHEHEHHEHHEHGEHEGGEHHHEHEGEEHHECEEHHHGHEEHHHHEHEHHHGHHHEHHEEHEEHHEGEEECECEHC
```

## Backbone H-bond Network

- total=80 · helix(i→i+4)=20 · sheet=60
  - I12 ↔ V16  (helix)
  - G14 ↔ G18  (helix)
  - V16 ↔ F20  (helix)
  - G18 ↔ R22  (helix)
  - F20 ↔ Y24  (helix)
  - R22 ↔ Q26  (helix)
  - Q26 ↔ K30  (helix)
  - N40 ↔ G44  (helix)
  - S55 ↔ H59  (helix)
  - H59 ↔ W63  (helix)
  - W63 ↔ K67  (helix)
  - E65 ↔ S69  (helix)
  - K67 ↔ K71  (helix)
  - S69 ↔ H73  (helix)
  - P70 ↔ I74  (helix)
  - K71 ↔ D75  (helix)
  - H73 ↔ A77  (helix)
  - I74 ↔ S78  (helix)
  - A77 ↔ N81  (helix)
  - N81 ↔ I85  (helix)
  - … +60 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=36 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=500 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=313 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.4213 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=30 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
