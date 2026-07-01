# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1NXB/sequence/1NXB.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1NXB/seeds/seed_1/1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 6.257 A
- tm_score_ca_ordered: 0.35092291988931207
- heavy_atom_rmsd: 7.313 A
- sidechain_heavy_atom_rmsd: 8.264 A
- **all-atom quality (honest):** heavy 7.313 A, sidechain 8.264 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 331
- bin_accuracy: 0.559

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.256951865571829
- ga_delta_rmsd: 0.3986876701175017  ga_fitness_mode: energy
- pre_local_rmsd: 6.256985444463165  localized_anchor_rmsd: 6.256985444463165

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Q5 → 3 conflicts (27%); E55 → 3 conflicts (27%)
- explained: 6/11 conflicts by 2 root cause(s)
- metrics: hubs=8 (frac 0.133), conflicts/hub=1.4, max_incompat=3.82Å, chain_span=0.85
- **fix-first:** [LOW_CONFLICT] Root cause(s): Q5 + E55 — explain ~6/11 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P18** — severity 3.60, 2 conflict(s); suspect input ~`C40` (group: push_out)
  - push-out (wants farther): K50@26.1Å(now 22.5,conf 0.72)
  - K50↔C40: targets 26.1/10.7Å but partners are 12.0Å apart → too_close_together by 3.4Å
  - K50↔G41: targets 26.1/11.9Å but partners are 10.9Å apart → too_close_together by 3.2Å
- **E37** — severity 2.80, 2 conflict(s); suspect input ~`E55` (group: push_out)
  - push-out (wants farther): E55@16.6Å(now 12.9,conf 0.55)
  - N4↔E55: targets 7.0/16.6Å but partners are 6.7Å apart → too_close_together by 2.9Å
  - H25↔E55: targets 5.9/16.6Å but partners are 8.5Å apart → too_close_together by 2.2Å
- **T12** — severity 2.08, 1 conflict(s); suspect input ~`I1` (group: push_out)
  - push-out (wants farther): S21@18.2Å(now 14.6,conf 0.55)
  - S21↔I1: targets 18.2/10.6Å but partners are 3.8Å apart → too_close_together by 3.8Å
- **Q5** — severity 1.95, 2 conflict(s); suspect input ~`K14` (group: pull_in)
  - pull-in (wants closer): K14@9.2Å(now 12.0,conf 0.55)
  - push-out (wants farther): C59@12.9Å(now 8.3,conf 0.55), C53@15.3Å(now 12.7,conf 0.55), L51@15.6Å(now 13.0,conf 0.55)
  - P18↔K14: targets 20.2/9.2Å but partners are 9.2Å apart → too_close_together by 1.8Å
  - K14↔E57: targets 9.2/14.6Å but partners are 3.6Å apart → too_close_together by 1.8Å
- **S56** — severity 1.89, 1 conflict(s); suspect input ~`C59` (group: push_out)
  - push-out (wants farther): P10@20.5Å(now 16.5,conf 0.59)
  - P10↔C59: targets 20.5/5.5Å but partners are 11.7Å apart → too_close_together by 3.4Å
- **C53** — severity 1.33, 1 conflict(s); suspect input ~`H6` (group: push_out)
  - push-out (wants farther): Q5@15.3Å(now 12.7,conf 0.55), H6@15.7Å(now 12.0,conf 0.55), G39@9.7Å(now 6.9,conf 0.55)
  - Y24↔H6: targets 4.6/15.7Å but partners are 8.7Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=30 · 3-10(G)=8 · coil(C)=5

```
CGHHEGHCEEEEGCEGGEHEGHCEEEEEHEHHHEEEEEEHEEEHHEEHCHEEEGGHEHHE
```

## Backbone H-bond Network

- total=97 · helix(i→i+4)=4 · sheet=93
  - F3 ↔ S7  (helix)
  - S29 ↔ G33  (helix)
  - C40 ↔ T44  (helix)
  - T44 ↔ G48  (helix)
  - Q5 ↔ P10  (sheet)
  - Q5 ↔ Q11  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ Y24  (sheet)
  - Q5 ↔ H25  (sheet)
  - Q9 ↔ H25  (sheet)
  - Q9 ↔ K26  (sheet)
  - Q11 ↔ H25  (sheet)
  - T15 ↔ E20  (sheet)
  - T15 ↔ Y24  (sheet)
  - T15 ↔ H25  (sheet)
  - E20 ↔ G39  (sheet)
  - Y24 ↔ I36  (sheet)
  - Y24 ↔ E37  (sheet)
  - Y24 ↔ R38  (sheet)
  - Y24 ↔ G39  (sheet)
  - … +77 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=282 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=191 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0388 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
